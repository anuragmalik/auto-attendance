

import static com.googlecode.charts4j.Color.ALICEBLUE;
import static com.googlecode.charts4j.Color.BLACK;
import static com.googlecode.charts4j.Color.LAVENDER;
import static com.googlecode.charts4j.Color.WHITE;
import static com.googlecode.charts4j.Color.newColor;
import static com.googlecode.charts4j.Color.*;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.charts4j.AxisLabels;
import com.googlecode.charts4j.AxisLabelsFactory;
import com.googlecode.charts4j.AxisStyle;
import com.googlecode.charts4j.AxisTextAlignment;
import com.googlecode.charts4j.BarChart;
import com.googlecode.charts4j.BarChartPlot;
import com.googlecode.charts4j.Color;
import com.googlecode.charts4j.Data;
import com.googlecode.charts4j.Fills;
import com.googlecode.charts4j.GCharts;
import com.googlecode.charts4j.LinearGradientFill;
import com.googlecode.charts4j.Plots;
public class AttChartSem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BarChartPlot subOne,subTwo,subThree,subFour,subFive,subSix,subTotal;
	int sc=0;
    @SuppressWarnings("deprecation")
	public static void setUpBeforeClass() throws Exception {
        Logger.global.setLevel(Level.ALL);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		String suid=request.getParameter("uid");
		
		String res="<table width=\"100%\"><tr><th colspan=\"4\" bgcolor=\"#c0c0c0\">This Semester</th>"+
	    		"</tr><tr><td colspan=\"2\"><table align=\"center\" width=\"90%\"><tr bgcolor=\"#dcdcdc\"><th>Subject</th>"+
	    		"<th>Total Lectures</th><th>Attended</th><th>Percentage</th></tr>";
		
		drawWeek(suid, res, response);
	
        
    }
    
    private void drawWeek(String suid, String res, HttpServletResponse response) throws IOException
    {
    	int total=0,totlec=0;
		double pert=0.0f;
		String[] slp=suid.split("-");
		String q;
		DecimalFormat df = new DecimalFormat("#.##");
		try { 
			javax.naming.InitialContext ctx= new javax.naming.InitialContext();
			javax.sql.DataSource ds =(javax.sql.DataSource)ctx.lookup("java:comp/env/jdbc/MyDataSource");
			java.sql.Connection con = ds.getConnection(); 
			java.sql.Statement st = con.createStatement();
			q="SELECT SUB_NAME,COLNO,SLCOUNT FROM Anurag.SUBJECTS,Anurag.STUDENT WHERE SUID='"+suid+"'AND Anurag.SUBJECTS.TCODE=Anurag.STUDENT.TCODE";
			java.sql.ResultSet rs = st.executeQuery(q);
		    while(rs.next()){
		    	java.sql.Statement str = con.createStatement();
		    	String w="SELECT "+rs.getString("COLNO").trim() +" FROM Anurag."+slp[1]+"_SATTENDANCE where suid='"+suid+"'";
		    	java.sql.ResultSet rsr = str.executeQuery(w);
		    	while(rsr.next()){
		    		int att=Integer.parseInt(rsr.getString(1).trim());
		    		total +=att;
		    		int lcount=Integer.parseInt(rs.getString("SLCOUNT").trim());
		    		totlec+=lcount;
		    		double per;
		    		if(lcount!=0)
		    		{per=(att*100)/lcount;}
		    		else
		    			per=0;		    		
		    		
		    		Color col=newColor("C67171");
		    		switch(sc){
		    		case 0: col=newColor("C67171"); break;
		    		case 1: col=newColor("63B8FF"); break;
		    		case 2: col=newColor("6495ED"); break;
		    		case 3: col=newColor("A2CD5A"); break;
		    		case 4: col=newColor("BC8F8F"); break;
		    		case 5: col=newColor("CCCCCC"); break;
		    		}
		    		
		    		BarChartPlot sub = Plots.newBarChartPlot(Data.newData(Integer.parseInt(df.format(per))), col,rs.getString("SUB_NAME").trim());
		    		switch(sc++){
		    		case 0:subOne=sub;break;
		    		case 1: subTwo=sub;break;
		    		case 2: subThree=sub;break;
		    		case 3: subFour=sub;break;
		    		case 4: subFive=sub;break;
		    		case 5: subSix=sub;break;
		    		default : break;
		    		}
		    		res +="<tr><td>"+rs.getString("SUB_NAME").trim()+"</td><td>"+lcount+"</td><td>"+att+"</td><td>"+per+"</td></tr>";
		    		} 			}
		    if(totlec!=0){ pert=(total*100)/totlec; }
		    else
		    	pert=0;
		    subTotal = Plots.newBarChartPlot(Data.newData(Integer.parseInt(df.format(pert))), newColor("388E8E"), "OverAll");
		    res +="<tr><td>Over All</td><td>"+totlec+"</td><td>"+total+"</td><td>"+pert+"</td></tr>";
		}
			
			catch (Exception e) {
				response.getWriter().println(e.toString());
			}
		        
		        BarChart chart = GCharts.newBarChart(subOne,subTwo,subThree,subFour,subFive,subSix,subTotal);
		        AxisStyle axisStyle = AxisStyle.newAxisStyle(BLACK, 10, AxisTextAlignment.CENTER);
		        AxisLabels score = AxisLabelsFactory.newAxisLabels("Percentage ", 50.0);
		        score.setAxisStyle(axisStyle);
		        AxisLabels year = AxisLabelsFactory.newAxisLabels("Subjects", 50.0);
		        year.setAxisStyle(axisStyle);
		        chart.addYAxisLabels(AxisLabelsFactory.newNumericRangeAxisLabels(0, 100));
		        chart.addXAxisLabels(year);
		        chart.setSize(350,200);
		        chart.setBarWidth(25);
		        chart.setSpaceWithinGroupsOfBars(2);
		        chart.setDataStacked(false);
		        chart.setTitle("Semester Attendance", FIREBRICK, 14);
		        chart.setGrid(100, 10, 3, 2);
		        chart.setBackgroundFill(Fills.newSolidFill(WHITE));
		        LinearGradientFill fill = Fills.newLinearGradientFill(0, WHITE, 100);
		        fill.addColorAndOffset(WHITE, 0);
		        chart.setAreaFill(fill);
		        String url = chart.toURLString();
		        
		        res +="</table></td><td colspan=\"2\"><img src="+url+"></img></td></tr></table>";
		        
		        response.getWriter().println(res);
    
    }
    
}
