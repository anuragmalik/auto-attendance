<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="mypkg.Connect"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Echelon - Homepage</title>


<!-- Meta Tags -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />



<!-- JavaScript -->

<script type="text/javascript" src="scripts/anurag.js"></script>
<script type="text/javascript" src="scripts/menu.js"></script>
<script type="text/javascript" src="scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="scripts/login.js"></script>
<script type="text/javascript" src="scripts/jquery1.4.2.js"></script>
<script type="text/javascript">
$(document).ready(function(){
$("#forMba").hide();	
$("#datac").hide();

$("#openBtech").live('click',function(){
	$("#forMba").hide();
	$("#forBtech").show();
});
$("#openMba").live('click',function(){
	$("#forMba").show();
	$("#forBtech").hide();
});
$("#btHead").live('click',function(){
	  $("#datac").slideUp();
	  $("#btech").slideDown();
	});
	
 $("#cseb").live('click',function(){
	 $("#datac").slideDown();
  $("#csep").slideDown();
  $("#ecep").slideUp();
  $("#mecp").slideUp();
  $("#itp").slideUp();
  $("#btech").slideUp();

});
$("#eceb").live('click',function(){
	 $("#datac").slideDown();
	$("#csep").slideUp();
  $("#ecep").slideDown();
  $("#mecp").slideUp();
  $("#itp").slideUp();
$("#btech").slideUp();

});
$("#mecb").live('click',function(){
	 $("#datac").slideDown();
  $("#csep").slideUp();
  $("#ecep").slideUp();
  $("#mecp").slideDown();
  $("#itp").slideUp();
$("#btech").slideUp();

});
$("#itb").live('click',function(){
	 $("#datac").slideDown();
  $("#csep").slideUp();
  $("#ecep").slideUp();
  $("#mecp").slideUp();
  $("#itp").slideDown();
$("#btech").slideUp();

});

});

</script>

<!-- CSS -->

<link rel="stylesheet" href="css/structure.css" type="text/css" />
<link rel="stylesheet" href="css/form.css" type="text/css" />
<link rel="stylesheet" href="css/theme.css" type="text/css" />
<link rel="stylesheet" href="css/header.css" type="text/css" />
<link rel="stylesheet" href="css/mytable.css" type="text/css" />
<link rel="stylesheet" href="css/accordion.css" type="text/css" />
<link
	href='http://fonts.googleapis.com/css?family=Julius+Sans+One|Quantico|Ruthie|Shojumaru'
	rel='stylesheet' type='text/css' />

</head>
<jsp:include page="Header.jsp" />

<body id="public">
	<div id="container">
		<div style="width: 100%" align="center">
			<img align="center" src="images/img_head.png" />
		</div>
		<form class="formatA">

			<ul>
				<table width="100%">
					<tr>
						<th bgcolor="#388E8E" id="openBtech" width="505">Bachelors in
							Technology</th>
						<th bgcolor="#C67171" id="openMba" width="50%">Masters in
							Business Administration</th>
					</tr>
				</table>

				<div id="forBtech">
					<div id="btHead" class="info">
						<h2>Bachelors in Technology</h2>
					</div>
					<div id="btech" class="post">

						<h3 class="heading">B.Tech. (Four Year Programme)</h3>

						<p>The admission to B.Tech (Four Year Programme) for the
							session 2013-14, shall be done by Haryana State Technical
							Education Society (HSTES) through online off campus counseling.
							Eligibility is as per HSTES rules.</p>
						<p>75% seats of the sanctioned intake in each branch will be
							filled by Haryana State Technical Education Society through
							online off campus counseling.</p>
						<p>25% seats will be filled by the Institute on the basis of
							All India Rank in JEE(Main)-2013 and Percentage of marks in the
							qualifying examination of 10+2 or its equivalent examination as
							per the norms of Haryana State Technical Education Society.</p>
						<p>
							For details visit <a href="http://www.techeduhry.nic.in">www.techeduhry.nic.in</a>
							Procedure and Schedule for filling up of remaining vacant seats
							out of 25% seats or out of 75% seats Admission will be made
							firstly on inter state merit of JEE( Main)-2013 rank and only
							thereafter on the basis of marks in qualifying exam.
						</p>

						<h3 class="heading">B.Tech. (three Year Programme)</h3>

						<p>The admission to B.Tech (Three Year Programme) for the
							session 2013-14, shall be done by Haryana State Technical
							Education Society (HSTES) through on-line off campus counseling.
							Eligibility criteria for above programmes in Echelon is 60% marks
							in aggregate in Diploma.</p>

						<h3 class="heading">M.Tech. (Comp. Science &amp; Engg.) :Two
							years full time programme</h3>

						<p>B.E./B.Tech or equivalent degree in Computer Science &amp;
							Engineering /Computer Engineering / Information Technology/
							Electronics &amp; Communication Engineering / Electronics
							Engineering / Electrical &amp; Electronics Engineering/
							Electronics &amp; Instrumentation Engineering / Electrical
							Engineering or Master of Computer Applications (MCA) or M.Sc.
							(Computer Science/IT/Software) or M.Sc. (Maths.) or M.Sc.
							(Physics) with at least 50% (45% for SC candidates of Haryana)
							marks.</p>

						<h3 class="heading">M.Tech. (Mechanical Engineering) :Two
							years full time programme</h3>
						<p>B.E./B.Tech., or, equivalent degree in Mechanical
							Engineering/ Production Engineering/ Thermal Power Engineering/
							Automobile Engineering./ Robotics Engineering/ CAD/ Mechatronics/
							Aeronautical Engineering/ Industrial Engineering.</p>
						<br> *The preference will be given to the candidates with
							valid GATE Score in the relevant discipline. <br><br>
									** The eligibility criteria, merit, and procedure for admission
									are subject to the guidelines issued by the M.D.University,
									Rohtak and DTE Govt. of Haryana. <br><br> ***
											Scholorship available to M. Tech. Students with GATE score. 
					</div>
					<table width="80%" align="center">
						<tr>
							<th id="cseb" bgcolor="#c0c0c0">Computer Science and
								Engineering</th>
							<th id="eceb" bgcolor="#c0c0c0">Electronics & Communication
								Engineering</th>
						</tr>

						<tr>
							<th id="mecb" bgcolor="#c0c0c0">Mechanical Engineering</th>
							<th id="itb" bgcolor="#c0c0c0">Information Technology</th>
						</tr>

					</table>




					<li class="section"><h3></h3></li>
					<div id="datac">
						<a name="course"></a>
						<table width="80%" align="center">
							<tr>
								<td><a name="cse">
										<div id="csep" style="padding: 0" align="justify">
											<h2>Computer Science and Engineering</h2>

											<p>
												The Department of Computer Science and Engineering was
												established in 2007. It offers four year B.Tech. programme
												&amp; two year M.Tech. programme in Computer Science &amp;
												Engineering affiliated to Mahrishi Dayanand University
												Rohtak. At present the intake for B. Tech. programme is 120
												and for M.Tech programme is 18.<br><br> The vision
														of the department is to produce quality professionals who
														are able to solve the complex problems of computer science
														and engineering. The mission of the department is to
														ensure the best teaching learning environment and
														encourages the students in extracurricular activities. The
														quality policy of department is to ensure global standards
														of excellence in our endeavors and to remain accountable
														through processes of self evaluation and continuous
														improvement.<br><br> The Department of Computer
																Science and Engineering aims to produce best software
																professionals at global level. The department has
																state-of-the-art of infrastructure class rooms, computer
																centre and computer labs with latest hardware and
																software. The department focuses on creative and
																innovative class room teaching, team work, interpersonal
																communication skills, and research activities. The
																department uses modern methodologies like interactive
																lectures, guided case studies, literature surveys and
																project work.<br><br> The labs are equipped
																		with i5, i3 and dual-core PCs with 4 GB / 2 GB RAM.
																		All labs are fully networked through high speed LAN
																		with Cisco Routers and managed switches having
																		Internet connectivity of 12Mbps, 1:1, RFlink along
																		with Wi-Fi (ZYXel). The computer labs includes
																		following: Multimedia Lab, Data Base Management System
																		Lab, Operating System Lab, Intelligent System Lab,
																		Neural Network Using MATLAB, Visual Programming Lab,
																		Project Lab, C++ Lab, Computer Graphics Lab, Data
																		Structure Lab, Internet Lab, PC Lab, Object Oriented
																		Programming Lab, Prolog Lab, Compiler Design Lab, Web
																		Development &amp; Java Lab etc.<br><br>
											</p>

											<h4>Programmes</h4>
											<ul class="list">
												<li>B.Tech. Full time - 4 year Under Graduate degree
													program.</li>
												<li>M.Tech Full time : 2 year post graduate degree
													program.</li>

											</ul>
											<p>The above programmes are approved by AICTE, Ministry
												of HRD, Govt. of India and affiliated to M D University,
												Rohtak.</p>
											<h4>Medium of Instruction</h4>
											<p>Medium of instruction for the course is English.</p>
											<table width="80%" align="center">
												<tr>
													<th>Intake(Total Students)</th>
													<td>120</td>
												</tr>
												<tr>
													<th>Fee Details (in Rs.)</th>
													<td>Rs 1,18,000/-</td>
												</tr>
												<tr>
													<th>University Charges (in Rs.)</th>
													<td>Rs 4,400/-</td>
												</tr>
												<tr>
													<th>Caution Money (in Rs.)</th>
													<td>Rs 2,000/-</td>
												</tr>
												<tr>
													<th>Subjects</th>
													<td>Physics, Maths, Chemistry..etc.</td>
												</tr>
											</table>
										</div></td>
							</tr>
							<tr>
								<td><a name="ece"></a>
									<div id="ecep" style="padding: 0" align="justify">
										<h2>Department of Electronics and Communication
											Engineering</h2>
										<p>
											Apart from a good foundation in Electronics, the Electronics
											and Communication Engineering students are provided in-depth
											knowledge to design, fabricate, maintain, supervise and
											manufacture electronic equipment relevant to entertainment
											media, health care, IT industry, communication and defence.
											They work with microprocessors, microcontrollers and fiber
											optics for applications in automation, communication and
											multimedia. The focus in the study program is on
											understanding electronic networks and devices,
											electromagnetic field theory, computer fundamentals,
											communication and control systems.<br> <br> The
													analog and digital electronics circuits have growth
													enormously in complexity and functionality in this IT age.
													To cope with this trend, knowledge and experience on the
													use of computer-aided design automation tools have become
													mandatory. Hence the Department has established its own
													computer lab with latest configuration hardware and most
													required software like MAT LAB, P-Spice, Xillnx etc.
													Digital System Design Laboratory equipped with FPGA, CPLD,
													CAD tools and boards from Xillnx. In the embedded system
													design lab, students learn assembly level and high level
													programming on the Atmel 8051/8052, Atmel AVR, PIC
													microcontrollers boards and tools. 8085 and 8086
													microprocessor simulator kits and boards are the basic
													features of the microprocessor lab.<br> <br> A
															few other labs like Control System, Instrumentation &amp;
															Measurement, Communication, Analog, Digital ,Network,
															Electrical Technology, Electrical Machines etc. are there
															in the department to enhance the practical skills of the
															students. <br> <br> The department has the
																	facility of PCB design with modern technology based
																	machines and design software where students can design,
																	simulate, fabricate and test circuits for their
																	projects.<br> <br> The class rooms are
																			equipped with the latest audio visual equipment. The
																			department has a strong Industry-Institutes
																			interaction and also offers consultancy services. The
																			faculty and students participate in National and
																			international conferences. In order to improve the
																			quality of man power, periodic training programmes
																			are being conducted by inviting eminent personalities
																			from Industry and academia 
										</p>
										<h4>Programme</h4>
										<ul class="list">
											<li>B.Tech. Full time - 4 year graduate degree program.</li>

											<li>M.Tech Full time : 2 year post graduate degree
												program.</li>
										</ul>
										<p>The above program is approved by AICTE, Ministry of
											HRD, Govt. of India and affiliated to M D University, Rohtak.
										</p>
										<h4>Medium of Instruction</h4>
										<p>Medium of instruction for the course is English.</p>

										<table wodth="80%" align="center">
											<tr>
												<th>Intake(Total Students)</th>
												<td>120</td>
											</tr>
											<tr>
												<th>Fee Details (in Rs.)</th>
												<td>Rs 1,0,000/-</td>
											</tr>
											<tr>
												<th>University Charges (in Rs.)</th>
												<td>Rs 4,400/-</td>
											</tr>
											<tr>
												<th>Caution Money (in Rs.)</th>
												<td>Rs 2,000/-</td>
											</tr>
											<tr>
												<th>Subjects</th>
												<td>Physics, Maths, Chemistry..etc.</td>
											</tr>
										</table>
									</div></td>
							</tr>
							<tr>
								<td><a name='mech'></a>
									<div id="mecp" style="padding: 0" align="justify">
										<h2 class="heading-clubs">Mechanical Engineering(ME)</h2>
										<p>The department of mechanical engineering offers a
											four-year program leading to the bachelors degree in
											mechanical engineering and two year full time program of
											masters degree. The department has current sanctioned intake
											of 240 in B. Tech. and 24 in M. Tech.</p>
										<p>The vision of the department is to create high quality
											mechanical engineers who can face the real world problems and
											adapt quickly to the rapid technological changes without
											sacrificing their ethical and moral values.</p>
										<p>The mission of the department is to impart the best
											teaching learning environment and to ensure sufficient
											technological exposure to the students by providing them high
											quality modern mechanical engineering laboratories. The
											department ensure their lifelong learning by effective
											counselling &amp; help them to achieve their career goals
											under guidance of highly qualified faculty members.</p>
										<p>The department of mechanical engineering strives to
											produce the best mechanical engineers who can perform
											globally. To sharpen core mechanical engineering skills of
											the students by judicious blend of theoretical and practical
											measures, the department is equipped with all the modern
											mechanical engineering laboratories such as CAD-CAM lab
											(having design software i.e. Auto CAD, Solid Works, CATIA,
											Ansys &amp; CREO), Thermodynamics lab, I C Engines and Gas
											Turbines lab, Fluid Mechanics lab, Fluid Machinery lab,
											Automobile Engineering lab, Refrigeration and Air
											Conditioning lab, Engineering Mechanics lab, Material Science
											lab, Strength of Materials lab, Production Technology and
											Mechanical Workshop. The department focuses on creative and
											innovative class room teaching, team work, interpersonal
											communication skills, and research activities. The department
											uses modern methodologies like interactive lectures, guided
											case studies, literature surveys and project work.</p>
										<p>The department of mechanical engineering has well
											qualified and experienced faculty members who can deliver
											with authority to guide, motivate and train the students in
											achieving their professional goals. The faculty members are
											actively involved with students in their practical projects.
											The department organizes free of cost in house summer
											training for mechanical engineering students to impart
											industry required designing skills in Auto CAD, Solid works,
											Catia, Ansys, Creo and uni-graphics.</p>
										<h4>Programme</h4>
										<ul class="list">
											<li>B.Tech Full time : 4 year under graduate degree
												program.</li>
											<li>M.Tech Full time : 2 year post graduate degree
												program.</li>
										</ul>
										<p>The above program is approved by AICTE, Ministry of
											HRD, Govt. of India and affiliated to M D University, Rohtak.
										</p>

										<h4>Medium of Instruction</h4>
										<p>Medium of instruction for the course is English.</p>

										<table wodth="80%" align="center">
											<tr>
												<th>Intake(Total Students)</th>
												<td>120</td>
											</tr>
											<tr>
												<th>Fee Details (in Rs.)</th>
												<td>Rs 98,000/-</td>
											</tr>
											<tr>
												<th>University Charges (in Rs.)</th>
												<td>Rs 4,400/-</td>
											</tr>
											<tr>
												<th>Caution Money (in Rs.)</th>
												<td>Rs 2,000/-</td>
											</tr>
											<tr>
												<th>Subjects</th>
												<td>Physics, Maths, Chemistry..etc.</td>
											</tr>
										</table>
									</div></td>
							</tr>

							<tr>
								<td>
									<div id="itp">
										<table wodth="80%" align="center">
											<tr>
												<th>Intake(Total Students)</th>
												<td>120</td>
											</tr>
											<tr>
												<th>Fee Details (in Rs.)</th>
												<td>Rs.98,000/-</td>
											</tr>
											<tr>
												<th>University Charges (in Rs.)</th>
												<td>Rs 4,400/-</td>
											</tr>
											<tr>
												<th>Caution Money (in Rs.)</th>
												<td>Rs 2,000/-</td>
											</tr>
											<tr>
												<th>Subjects</th>
												<td>Physics, Maths, Chemistry..etc.</td>
											</tr>
										</table>
									</div>
								</td>
							</tr>

						</table>

					</div>
				</div>

				<div id="forMba">
					<div id=" " class="info">
						<h2>Masters in Business Administration</h2>
					</div>
					<h3>Post Graduate Course</h3>
					<p>The Department of Management Studies of Echelon Institute of
						Technology was established in the year 2008. It offers two years
						full time MBA degree course under U.P. Technical University. The
						present intake is 60 students. It serves as a vibrant attractive
						destination for aspirants seeking a career in management. MBA
						degree course is offered with specializations in Human Resources
						Management, Marketing and Finance.</P>
					<P>The faculty members have published a number of articles and
						research papers in various journals and have presented papers in
						national and international conferences. They also have attended
						FDPs and Workshops in reputed institutes like IIM, IGIDR, IIT,
						IIFT etc. The Department also organised various students
						development programmes like workshops, conferences, seminars,
						debates, soft skill development, industry visits, industry
						interaction, etc.</p>
					</p>
					<h4>Eligibility</h4>
					<p>Bachelor's Degree from recognized university with minimum
						50% marks or UPSEE 2010 / CAT / MAT qualified.</p>
					<h4>Course Duration and Fee</h4>
					<p>2 Years</p>
					<p>Rs. 1,07,750</p>

				</div>

			</ul>
		</form>
	</div>

</body>
</html>