<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bibliometry goes Online</title>
<link rel="stylesheet" type="text/css" href="../resources/main.css"/>
<link rel="shortcut icon" type="image/ico" href="../resources/favicon.ico" />
<%@ page language="java" import="model.SearchClient_model" %>
<%@ page language="java" import="model.SearchResult_model" %>
<%@ page language="java" import="model.SearchAuthor_model" %>
<%@ page language="java" import="model.SearchAMRResult_model" %>
<%@ page language="java" import="model.SearchJCRResult_model" %>
<%@ page language="java" import="model.excelDisplay_model" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="javax.servlet.http.Cookie" %>

<SCRIPT language="javascript">

function validate_form(){
	var form = document.getElementById("form1");
	
	if((document.getElementById("topicSearch").value != '') || (document.getElementById("titleSearch").value != '')
	 || (document.getElementById("authorSearch").value != '') || (document.getElementById("publicationNameSearch").value != '')
	  || (document.getElementById("editorSearch").value != '')  || (document.getElementById("groupAuthorSearch").value != '')
	   || (document.getElementById("doiSearch").value != '')  || (document.getElementById("addressSearch").value != '')
	    || (document.getElementById("yearPublishedSearch").value != '')){
			form.action = "../system/search";
			return true;
		}else{
		   alert("Enter valid search value!");
		   return false;
		}
}

function validate_author(){
	var form = document.getElementById("form1");
	if((document.getElementById("topicSearch").value != '') || (document.getElementById("titleSearch").value != '')
	 || (document.getElementById("authorSearch").value != '') || (document.getElementById("publicationNameSearch").value != '')
	  || (document.getElementById("editorSearch").value != '')  || (document.getElementById("groupAuthorSearch").value != '')
	   || (document.getElementById("doiSearch").value != '')  || (document.getElementById("addressSearch").value != '')
	    || (document.getElementById("yearPublishedSearch").value != '')){
			form.action = "../system/authors";
			return true;
		}else{
		   alert("Enter valid search value!");
		   return false;
		}
}

function validate_excel(){
	var form = document.getElementById("form1");
	
	form.action = "../system/excelNormal";
	return true;
}	
function append_excel(){
	var form = document.getElementById("form1");
	form.action = "../system/excelAppend";
	return true;
}

function insert_excel(){
	var form = document.getElementById("form1");
	form.action = "../system/excelInsert";
	return true;
}	
function validate_insert(){
	var el = document.getElementById("insert_box");
	el.style.display = "block";
	
}
function fill_author(){
	var j = 0;
	var checkedValue = null; 
	var inputElements = document.getElementsByTagName('input');
	for(var i=0; inputElements[i]; ++i){
	      if(inputElements[i].className==="message_checkbox" && 
	         inputElements[i].checked){
	    	  if(j == 0){
	    		  checkedValue = inputElements[i].value;
	    		  document.getElementById('authorSearch').value =  checkedValue;
	    		  j = 1;
	    	  }else{
	    		  checkedValue = inputElements[i].value;
		           document.getElementById('authorSearch').value += " OR "+checkedValue;
	    	  }
	           
	      }
	}
}
function OnChangeCheckbox(checkbox) {
	var ie = document.getElementsByTagName('input');
	if (checkbox.checked) {
        for(var i=0; ie[i]; ++i){
        	if(ie[i].className==="checkme"){
        		ie[i].checked = true;
        	}
        }
    }
    else {
        for(var i=0; ie[i]; ++i){
        	if(ie[i].className==="checkme"){
        		ie[i].checked = false;
        	}
        }

    }
}
</SCRIPT>
</head>
<body>
<div class="font_title" style='width:1500px; padding:30px 0px; vertical-align:bottom;'><img src="../resources/TUM_Logo.jpeg" align="left" alt="" />Bibliometry goes Online</div> <br>
<form method=get id=form1>
<div id='searchdivision' style='display:block;'>
<%
out.println("<table style='margin:0px 0px 20px 0px;'><tr>");
	out.println("<td><a href='../system/index' class='link_1'>HOME </a></td>");
	out.println("<td><a href='../system/excelUpload' class='link_1'>| JCR UPLOAD </a></td>");
	out.println("<td><a href='../system/excelMerge' class='link_1'>| MERGE EXCEL</a></td>");
	out.println("<td><a href='../resources/Helpfile.pdf' target='_blank' class='link_1'>| HELP</a></td>");
out.println("</tr></table>"); 
	out.println("<table id='table1' class='border_1' width='850px;'>");
		out.println("<tr>");
			out.println("<td colspan=3>");
			out.println("<span class='font_h2' style='width:200px;'>Search Criteria</span> ");
			out.println("</td>");
		out.println("</tr>");
		
		out.println("<tr id='Topic'>");
			out.println("<td colspan=2 width=200px;>");
				out.println("<span class='font_content' style='margin-left:64px'>Topic :  </span>");
			out.println("</td>");
			out.println("<td colspan=2>");
				out.println("<input type='text' class='inp1' name='topicSearch' id='topicSearch'/> ");
				out.println("<div class='font_h2' style='padding: 1px 0px 5px 0px'>Example: oil spill* mediterranean</div>");
			out.println("</td>");
		out.println("</tr>");
		
		out.println("<tr id='Title'>");
			out.println("<td>");
				out.println("<select class='font_content' name='operation1'><option>AND</option>"
							+"<option>OR</option><option>NOT</option></select>");
			out.println("</td>");
			out.println("<td width=200px;>");
				out.println("<span class='font_content'>Title :  </span>");
			out.println("</td>");
			out.println("<td colspan=2>");
				out.println("<input type='text' class='inp1' name='titleSearch' id='titleSearch'/> ");
				out.println("<div class='font_h2' style='padding: 1px 0px 5px 0px'>Example: oil spill* mediterranean</div>");
			out.println("</td>");
		out.println("</tr>");
		
		out.println("<tr id='Author'>");
			out.println("<td>");
				out.println("<select class='font_content' name='operation2'><option>AND</option>"
					+"<option>OR</option><option>NOT</option></select>");
			out.println("</td>");
			out.println("<td width=200px; style='margin-left:-80px'>");
				out.println("<span class='font_content'>Author :  </span>");
			out.println("</td>");
			out.println("<td>");
				out.println("<input type='text' class='inp1' name='authorSearch' id='authorSearch'/>");
				out.println("<div class='font_h2' style='padding: 1px 0px 5px 0px'>Example: O'Brian C* OR OBrian C*</div>");
			out.println("</td>");
			out.println("<td width=30px;>");
				out.println("<input type='submit' value='Find' onclick='validate_author()'  style='width:50px; margin: -20px 0px 0px 0px;'/>");
			out.println("</td>");
		out.println("</tr>");
		
			out.println("<tr id='PublicationName'>");
				out.println("<td>");
					out.println("<select class='font_content' name='operation3'><option>AND</option>"
								+"<option>OR</option><option>NOT</option></select>");
				out.println("</td>");
				out.println("<td width=200px;>");
					out.println("<span class='font_content'>Publication Name :  </span>");
				out.println("</td>");
			out.println("<td>");
				out.println("<input type='text' class='inp1' name='publicationNameSearch' id='publicationNameSearch'/> ");
				out.println("<div class='font_h2' style='padding: 1px 0px 5px 0px'>Example: Cancer* OR Journal of Cancer Research and Clinical Oncology</div>");
			out.println("</td>");
		out.println("</tr>");
		
		out.println("<tr id='Editor'>");
			out.println("<td>");
				out.println("<select class='font_content' name='operation4'><option>AND</option>"
							+"<option>OR</option><option>NOT</option></select>");
			out.println("</td>");
			out.println("<td width=200px;>");
				out.println("<span class='font_content'>Editor :  </span>");
			out.println("</td>");
			out.println("<td colspan=2>");
				out.println("<input type='text' class='inp1' name='editorSearch' id='editorSearch'/> ");
				out.println("<div class='font_h2' style='padding: 1px 0px 5px 0px'>Example: Smith JC OR Smith J*</div>");
			out.println("</td>");
		out.println("</tr>");
		
		out.println("<tr id='GroupAuthor'>");
			out.println("<td>");
				out.println("<select class='font_content' name='operation5'><option>AND</option>"
							+"<option>OR</option><option>NOT</option></select>");
			out.println("</td>");
			out.println("<td width=200px;>");
				out.println("<span class='font_content'>Group Author :  </span>");
			out.println("</td>");
			out.println("<td colspan=2>");
				out.println("<input type='text' class='inp1' name='groupAuthorSearch' id='groupAuthorSearch'/> ");
				out.println("<div class='font_h2' style='padding: 1px 0px 5px 0px'>Example: CERN</div>");
			out.println("</td>");
		out.println("</tr>");
		
		out.println("<tr id='DOI'>");
			out.println("<td>");
				out.println("<select class='font_content' name='operation6'><option>AND</option>"
							+"<option>OR</option><option>NOT</option></select>");
			out.println("</td>");
			out.println("<td width=200px;>");
				out.println("<span class='font_content'>DOI :  </span>");
			out.println("</td>");
			out.println("<td colspan=2>");
				out.println("<input type='text' class='inp1' name='doiSearch' id='doiSearch'/> ");
				out.println("<div class='font_h2' style='padding: 1px 0px 5px 0px'>Example: 10.1134/S1061920808010020 OR 10.1134*</div>");
			out.println("</td>");
		out.println("</tr>");
		out.println("<tr id='YearPublished'>");
			out.println("<td>");
				out.println("<select class='font_content' name='operation7'><option>AND</option>"
							+"<option>OR</option><option>NOT</option></select>");
			out.println("</td>");
			out.println("<td width=200px;>");
				out.println("<span class='font_content'>Year Published :  </span>");
			out.println("</td>");
			out.println("<td colspan=2>");
				out.println("<input type='text' class='inp1' name='yearPublishedSearch' id='yearPublishedSearch'/> ");
				out.println("<div class='font_h2' style='padding: 1px 0px 5px 0px'>Example: 2001 OR 1997-1999</div>");
			out.println("</td>");
		out.println("</tr>");
	
		out.println("<tr id='Address'>");
			out.println("<td>");
				out.println("<select class='font_content' name='operation8'><option>AND</option>"
							+"<option>OR</option><option>NOT</option></select>");
			out.println("</td>");
			out.println("<td width=200px;>");
				out.println("<span class='font_content'>Address :  </span>");
			out.println("</td>");
			out.println("<td colspan=2>");
				out.println("<input type='text' class='inp1' name='addressSearch' id='addressSearch'/> ");
				out.println("<div class='font_h2' style='padding: 1px 0px 5px 0px'>Example: Unilever SAME India</div>");
			out.println("</td>");
		out.println("</tr>");
	out.println("</table>");
	
	out.println("<table width='850px;' class='border_1' style='padding-top:20px;'>");
		out.println("<tr>");
			out.println("<td width=50px>");
			out.println("</td>");
			out.println("<td>");
				out.println("<span class='font_content' style='width:200px; padding-top: -20px;'>Timespan From : </span>");
			out.println("</td>");
			out.println("<td colspan=2>");
				out.println("<input type='text' class='inp1' name='timeSpanFrom' id='timeSpanFrom' width=150px; style='margin-left:40px;'/>");
				out.println("<div class='font_h2' style='padding: 1px 0px 5px 0px; margin-left:40px;'>Example: 1900-01-01 If this field is empty, 1900-01-01 will be filled.</div>");
			out.println("</td>");
		out.println("</tr>");
		out.println("<tr>");
			out.println("<td width=50px>");
			out.println("</td>");
			out.println("<td>");
				out.println("<span class='font_content' style='width:200px; padding-top: -20px;'>Timespan To :  </span>");
			out.println("</td>");
			out.println("<td colspan=2>");
				out.println("<input type='text' class='inp1' name='timeSpanTo' id='timeSpanTo' width=150px; style='margin-left:40px;'/>");
				out.println("<div class='font_h2' style='padding: 1px 0px 5px 0px; margin-left:40px;'>Example: 2012-12-31 If this field is empty, today's date will be filled.</div>");
			out.println("</td>");
		out.println("</tr>");
	out.println("</table>");			
	

	out.println("<input type='submit' value='Search' onclick='return validate_form()'  style='width:850px; margin: 10px 20px 10px 10px;'/>");
	
	
	ArrayList<SearchResult_model> srl = (ArrayList<SearchResult_model>) request.getAttribute("SearchResult");
	ArrayList<SearchAMRResult_model> sarl = (ArrayList<SearchAMRResult_model>) request.getAttribute("SearchAMRResult");
	ArrayList<SearchJCRResult_model> sjcr = (ArrayList<SearchJCRResult_model>) request.getAttribute("SearchJCRResult");
	
	String h_index = (String)request.getAttribute("h_index");
	String h_core = (String)request.getAttribute("h_core");
	String e_core = (String)request.getAttribute("e_core");
	
	int i = 1;
	if ((srl != null) && (!srl.isEmpty()) && (sarl != null) && (!sarl.isEmpty())&& (sjcr != null) && (!sjcr.isEmpty())) {
		ListIterator<SearchResult_model> li0 = srl.listIterator();
		ListIterator<SearchAMRResult_model> li1 = sarl.listIterator();
		ListIterator<SearchJCRResult_model> li2 = sjcr.listIterator();
		SearchResult_model sr;
		SearchAMRResult_model sar;
		SearchJCRResult_model sjr;
		
		out.println("<table id='table2' class='border_1' width='1000px;'><thead>");
			out.println("<tr>");
				out.println("<th scope='col'  class='border_2' width='30px;'>");
					out.println("<span class='table_title' style='align:left;'>Select</span>");
					out.println("<input type='checkbox' name='checkall' id='checkall' onclick='OnChangeCheckbox(this)'>");
				out.println("</th>");
				out.println("<th scope='col' class='border_2' width='100px;'>");
					out.println("<span  class='table_title' style='align:left;'>Article id</span>");
				out.println("</th>");
				out.println("<th scope='col' class='border_2' width='100px;'>");
					out.println("<span  class='table_title' style='align:left;'>Author_1</span>");
				out.println("</th>");
				out.println("<th scope='col' class='border_2' width='100px;'>");
					out.println("<span  class='table_title' style='align:left;'>Author_2</span>");
				out.println("</th>");
				out.println("<th scope='col' class='border_2' width='100px;'>");
					out.println("<span  class='table_title' style='align:left;'>Author_3</span>");
				out.println("</th>");
				out.println("<th scope='col' class='border_2' width='100px;'>");
					out.println("<span  class='table_title' style='align:left;'>Author_4</span>");
				out.println("</th>");
				out.println("<th scope='col' class='border_2' width='100px;'>");
					out.println("<span  class='table_title' style='align:left;'>Author_5</span>");
				out.println("</th>");
				out.println("<th scope='col' class='border_2' width='200px;'>");
					out.println("<span  class='table_title' style='align:left;'>Other Authors</span>");
				out.println("</th>");
				out.println("<th scope='col' class='border_2' width='100px;'>");
					out.println("<span  class='table_title' style='align:left;'>Published Year</span>");
				out.println("</th>");
				out.println("<th scope='col' class='border_2' width='200px;'>");
					out.println("<span  class='table_title' style='align:left;'>Journal</span>");
				out.println("</th>");
				out.println("<th scope='col' class='border_2' width='200px;'>");
					out.println("<span  class='table_title' style='align:left;'>Issue</span>");
				out.println("</th>");
				out.println("<th scope='col' class='border_2' width='200px;'>");
					out.println("<span  class='table_title' style='align:left;'>Title</span>");
				out.println("</th>");
				out.println("<th scope='col' class='border_2' width='200px;'>");
					out.println("<span  class='table_title' style='align:left;'>No. of Publications</span>");
				out.println("</th>");
				out.println("<th scope='col' class='border_2' width='200px;'>");
					out.println("<span  class='table_title' style='align:left;'>h-index</span>");
				out.println("</th>");
				out.println("<th scope='col' class='border_2' width='200px;'>");
					out.println("<span  class='table_title' style='align:left;'>h-core</span>");
			    out.println("</th>");
			    out.println("<th scope='col' class='border_2' width='200px;'>");
			    	out.println("<span  class='table_title' style='align:left;'>e-index</span>");
		        out.println("</th>");
		        out.println("<th scope='col' class='border_2' width='200px;'>");
			    out.println("<span  class='table_title' style='align:left;'>Immidiacy index</span>");
		        out.println("</th>");
		        out.println("<th scope='col' class='border_2' width='200px;'>");
				out.println("<span  class='table_title' style='align:left;'>5-year Impact Factor</span>");
			    out.println("</th>");
			    out.println("<th scope='col' class='border_2' width='200px;'>");
				out.println("<span  class='table_title' style='align:left;'>Impact Factor</span>");
			out.println("</th>");
				out.println("<th scope='col' class='border_2' width='200px;'>");
				out.println("<span  class='table_title' style='align:left;'>Articles Cited</span>");
			out.println("</th>");
			out.println("<th scope='col' class='border_2' width='200px;'>");
				out.println("<span  class='table_title' style='align:left;'>Source URL</span>");
			out.println("</th>");
			out.println("<th scope='col' class='border_2' width='200px;'>");
				out.println("<span  class='table_title' style='align:left;'>Impact Factor URL</span>");
			out.println("</th>");
				
			out.println("</tr></thead>");

		while (li0.hasNext() && li1.hasNext() && li2.hasNext()) {
			sr = (SearchResult_model) li0.next();
			sar = (SearchAMRResult_model) li1.next();
			sjr = (SearchJCRResult_model) li2.next();
			out.println("<tbody><tr>");
			out.println("<td class='border_2'>");
			out.println("<input type='checkbox' class='checkme' name='checkme' value="+sr.getsid()+" ><span class='table_content' style='align:left;'> "+sr.getsid()+"</span>");
			out.println("<input type='text' name='sid_"+sr.getsid()+"' id='sid_"+sr.getsid()+"' value="+sr.getsid()+" style='display:none'/>");
			out.println("</td>");
			out.println("<td class='border_2'>");
			out.println("<span class='table_content' style='align:left;'>"
					+ sar.getUT() + "</span>");
			out.println("<input type='text' name='aid_"+sr.getsid()+"' id='aid_"+sr.getsid()+"' value='"+sar.getUT().trim()+"' style='display:none'/>");
			out.println("</td>");
			out.println("<td class='border_2'>");
			out.println("<span class='table_content' style='align:left;'>"+ sr.getAuthor_1() + "</span>");
			out.println("<input type='text' name='auth1_"+sr.getsid()+"' id='auth1_"+sr.getsid()+"' value='"+sr.getAuthor_1().trim()+"' style='display:none'/>");
			out.println("</td>");
			out.println("<td class='border_2'>");
			if(sr.getAuthor_2() != null){
				out.println("<span class='table_content' style='align:left;'>"+ sr.getAuthor_2() + "</span>"); 
				out.println("<input type='text' name='auth2_"+sr.getsid()+"' id='auth2_"+sr.getsid()+"' value='"+sr.getAuthor_2().trim()+"' style='display:none'/>");
			}else{
				out.println("<span class='n_a' style='align:left;'>Not Available</span>");
				out.println("<input type='text' name='auth2_"+sr.getsid()+"' id='auth2_"+sr.getsid()+"' value='-99' style='display:none'/>");
			}
			out.println("</td>");
			out.println("<td class='border_2'>");
			if(sr.getAuthor_3() != null){
				out.println("<span class='table_content' style='align:left;'>"+ sr.getAuthor_3() + "</span>");
				out.println("<input type='text' name='auth3_"+sr.getsid()+"' id='auth3_"+sr.getsid()+"' value='"+sr.getAuthor_3().trim()+"' style='display:none'/>");
			}else{
				out.println("<span class='n_a' style='align:left;'>Not Available</span>");
				out.println("<input type='text' name='auth3_"+sr.getsid()+"' id='auth3_"+sr.getsid()+"' value='-99' style='display:none'/>");
			}
			
			out.println("</td>");
			out.println("<td class='border_2'>");
			if(sr.getAuthor_4() != null){
				out.println("<span class='table_content' style='align:left;'>"+ sr.getAuthor_4() + "</span>");
				out.println("<input type='text' name='auth4_"+sr.getsid()+"' id='auth4_"+sr.getsid()+"' value='"+sr.getAuthor_4().trim()+"' style='display:none'/>");
			}else{
				out.println("<span class='n_a' style='align:left;'>Not Available</span>");
				out.println("<input type='text' name='auth4_"+sr.getsid()+"' id='auth4_"+sr.getsid()+"' value='-99' style='display:none'/>");
			}
			
			out.println("</td>");
			out.println("<td class='border_2'>");
			if(sr.getAuthor_5() != null){
				out.println("<span class='table_content' style='align:left;'>"+ sr.getAuthor_5() + "</span>");
				out.println("<input type='text' name='auth5_"+sr.getsid()+"' id='auth5_"+sr.getsid()+"' value='"+sr.getAuthor_5().trim()+"' style='display:none'/>");
			}else{
				out.println("<span class='n_a' style='align:left;'>Not Available</span>");
				out.println("<input type='text' name='auth5_"+sr.getsid()+"' id='auth5_"+sr.getsid()+"' value='-99' style='display:none'/>");
			}
			
			out.println("</td>");
			out.println("<td class='border_2'>");
			if(sr.getOther_Author() != null){
				out.println("<span class='table_content' style='align:left;'>"+ sr.getOther_Author() + "</span>");
				out.println("<input type='text' name='autho_"+sr.getsid()+"' id='autho_"+sr.getsid()+"' value='"+sr.getOther_Author().trim()+"' style='display:none'/>");
			}else{
				out.println("<span class='n_a' style='align:left;'>Not Available</span>");
				out.println("<input type='text' name='autho_"+sr.getsid()+"' id='autho_"+sr.getsid()+"' value='-99' style='display:none'/>");
			}
			
			out.println("</td>");
			out.println("<td class='border_2'>");
			out.println("<span class='table_content' style='align:left;'>"+ sr.getPublishedYear() + "</span>");
			out.println("<input type='text' name='pubyr_"+sr.getsid()+"' id='pubyr_"+sr.getsid()+"' value='"+sr.getPublishedYear().trim()+"' style='display:none'/>");
			out.println("</td>");
			out.println("<td class='border_2'>");
			out.println("<span class='table_content' style='align:left;'>"+ sr.getJournal() + "</span>");
			out.println("<input type='hidden' name='jour_"+sr.getsid()+"' id='jour_"+sr.getsid()+"' value='"+sr.getJournal().trim()+"'/>");
			out.println("</td>");
			out.println("<td class='border_2'>");
			if(sr.getIssue() != null){
				out.println("<span class='table_content' style='align:left;'>"+ sr.getIssue() + "</span>");
				out.println("<input type='text' name='issue_"+sr.getsid()+"' id='issue_"+sr.getsid()+"' value="+sr.getIssue()+" style='display:none'/>");
			}else{
				out.println("<span class='n_a' style='align:left;'>Not Available</span>");
				out.println("<input type='text' name='issue_"+sr.getsid()+"' id='issue_"+sr.getsid()+"' value='-99' style='display:none'/>");
			}
			out.println("</td>");
			
			out.println("<td class='border_2'>");
			out.println("<span class='table_content' style='align:left;'>"+ sr.getTitle() + "</span>");
			out.println("<input type='text' name='title_"+sr.getsid()+"' id='title_"+sr.getsid()+"' value='"+sr.getTitle().trim()+"' style='display:none'/>");
			out.println("</td>");
			
			out.println("<td class='border_2'>");
			
				out.println("<span class='n_a' style='align:left;'>Not Available</span>");
				out.println("<input type='text' name='puban_"+sr.getsid()+"' id='puban_"+sr.getsid()+"' value='-99' style='display:none'/>");
			
			out.println("</td>");
			
			out.println("<td class='border_2'>");
			if(h_index != null){
				out.println("<span class='table_content' style='align:left;'>"+ h_index + "</span>");
			}else{
				out.println("<span class='n_a' style='align:left;'>Not Available</span>");
			}
			out.println("<input type='text' name='hindex_"+sr.getsid()+"' id='hindex_"+sr.getsid()+"' value="+h_index+" style='display:none'/>");
			out.println("</td>");
			
			out.println("<td class='border_2'>");
			if(h_core != null){
				out.println("<span class='table_content' style='align:left;'>"+ h_core + "</span>");
			}else{
				out.println("<span class='n_a' style='align:left;'>Not Available</span>");
			}
			out.println("<input type='text' name='hcore_"+sr.getsid()+"' id='hcore_"+sr.getsid()+"' value="+h_core+" style='display:none'/>");
			out.println("</td>");
			
			out.println("<td class='border_2'>");
			if(e_core != null){
				out.println("<span class='table_content' style='align:left;'>"+ e_core + "</span>");
			}else{
				out.println("<span class='n_a' style='align:left;'>Not Available</span>");
			}
			out.println("<input type='text' name='ecore_"+sr.getsid()+"' id='ecore_"+sr.getsid()+"' value="+e_core+" style='display:none'/>");
			out.println("</td>");
			
			out.println("<td class='border_2'>");
			if(!sjr.getImmediacyIndex().contains("-99")){
				out.println("<span class='table_content' style='align:left;'>"+ sjr.getImmediacyIndex() + "</span>");
				out.println("<input type='text' name='ii_"+sr.getsid()+"' id='ii_"+sr.getsid()+"' value="+sjr.getImmediacyIndex()+" style='display:none'/>");
			}else{
				out.println("<span class='n_a' style='align:left;'>Not Available</span>");
				out.println("<input type='text' name='ii_"+sr.getsid()+"' id='ii_"+sr.getsid()+"' value='-99' style='display:none'/>");
			}
			out.println("</td>");
			
			out.println("<td class='border_2'>");
			if(!sjr.getImpactFactor_5year().contains("-99")){
				out.println("<span class='table_content' style='align:left;'>"+ sjr.getImpactFactor_5year() + "</span>");
				out.println("<input type='text' name='if5_"+sr.getsid()+"' id='if5_"+sr.getsid()+"' value="+sjr.getImpactFactor_5year()+" style='display:none'/>");
			}else{
				out.println("<span class='n_a' style='align:left;'>Not Available</span>");
				out.println("<input type='text' name='if5_"+sr.getsid()+"' id='if5_"+sr.getsid()+"' value='-99' style='display:none'/>");
			}
			out.println("</td>");
			
			out.println("<td class='border_2'>");
			if(!sjr.getImpactFactor().contains("-99")){
				out.println("<span class='table_content' style='align:left;'>"+ sjr.getImpactFactor() + "</span>");
			out.println("<input type='text' name='if_"+sr.getsid()+"' id='if_"+sr.getsid()+"' value="+sjr.getImpactFactor()+" style='display:none'/>");
			}else{
				out.println("<span class='n_a' style='align:left;'>Not Available</span>");
			out.println("<input type='text' name='if_"+sr.getsid()+"' id='if_"+sr.getsid()+"' value='-99' style='display:none'/>");
			}
			out.println("</td>");
			
			out.println("<td class='border_2'>");
			if(sar.getTimesCited() != null){
				out.println("<span class='table_content' style='align:left;'>"+ sar.getTimesCited() + "</span>");
			out.println("<input type='text' name='tc_"+sr.getsid()+"' id='tc_"+sr.getsid()+"' value='"+sar.getTimesCited()+"' style='display:none'/>");
			}else{
				out.println("<span class='n_a' style='align:left;'>Not Available</span>");
			out.println("<input type='text' name='tc_"+sr.getsid()+"' id='tc_"+sr.getsid()+"' value='-99' style='display:none'/>");
			}
			out.println("</td>");
			
			out.println("<td class='border_2'>");
			if(sar.getSourceURL() != null){
				out.println("<span class='table_content' style='align:left;'><a href='"+ sar.getSourceURL() + "' target='_blank'> Click here for Source URL for this record</a></span>");
			out.println("<input type='text' name='surl_"+sr.getsid()+"' id='surl_"+sr.getsid()+"' value='s' style='display:none'/>");
			session.setAttribute("surl_"+sr.getsid(), sar.getSourceURL() );
			}else{
				out.println("<span class='n_a' style='align:left;'>Not Available</span>");
			out.println("<input type='text' name='surl_"+sr.getsid()+"' id='surl_"+sr.getsid()+"' value='-99' style='display:none'/>");
			}
			out.println("</td>");
			
			out.println("<td class='border_2'>");
			if(sjr.getimpactURL() != null){
				out.println("<span class='table_content' style='align:left;'><a href='"+ sjr.getimpactURL() + "' target='_blank'> Click here for Impact Factor Graph URL</a></span>");
			out.println("<input type='text' name='ifurl_"+sr.getsid()+"' value='' style='display:none'/>");
			session.setAttribute( "ifurl_"+sr.getsid(), sjr.getimpactURL() );
			}else{
				out.println("<span class='n_a' style='align:left;'>Not Available</span>");
			out.println("<input type='text' name='ifurl_"+sr.getsid()+"' value='-99' style='display:none'/>");
			}
			out.println("</td>");
			
			if(!li0.hasNext()){
				out.println("<table width='1000px;' style='padding-top:20px;'>");
				out.println("<tr>");
					out.println("<td>");
						out.println("<span class='font_content' style='width:200px; padding-top: -20px;'>Records Searched : </span>");
						out.println("<span class='res_1' style='width:200px; padding-top: -20px;'>"+ sr.getRecordsSearched() + "</span>");
					out.println("</td>");
					out.println("<td>");
						out.println("<span class='font_content' style='width:200px; padding-top: -20px;'>Records Found : </span>");
						out.println("<span class='res_1' style='width:200px; padding-top: -20px;'>"+ sr.getRecordsFound() + "</span>");
						out.println("<input type='text' name='rec_found' id='rec_found' value="+sr.getRecordsFound()+" style='display:none'/>");
					out.println("</td>");
				out.println("</tr>");
				out.println("<tr><td><input type='submit' value='Export to Excel' style='width:400px; margin: 10px 20px 10px 10px;' onclick='return validate_excel();'/></td>");
				//out.println("<tr><td><input name='eopt_0' id='eopt_0' type='submit' value='Export to Excel' style='width:400px; margin: 10px 20px 10px 10px;' onclick='return validate_excel(); && sr.setExcelUpdate(0)'/></td>");
				out.println("<td><input type='submit' value='Append to Excel' style='width:400px; margin: 10px 20px 10px 10px;' onclick='return append_excel();'/></td>");
				out.println("<td><input type='button' value='Insert & Append to Excel' style='width:400px; margin: 10px 20px 10px 10px;' onclick='return validate_insert();'/></td></tr>");
			out.println("</table>");
			%>
			<table id="insert_box" style="display:none" style='margin:0px 0px 20px 0px;'>
			<tr>
				<td>
					<span class='res_1' style='margin-left:20px;'>Copy the file path here :</span>
				</td>
				<td>
					<input type=text id='upload_excel' name='upload_excel' style='width:655px; margin-left:10px;'>
					<div>
						<span class='warning' style='margin-left:10px;'> Format should be <B>Excel 97-2004 Workbook (.xls)</B></span>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan=2>
					<div style='margin-top:20px; margin-left:20px;'>
						<input  type='submit' value='Upload' onclick= 'return insert_excel();' style = 'width:820px'>
					</div>
				</td>
			</tr>
			</table>
			<%}
		}
		out.println("</tbody></tr>");
	out.println("</table>");
	}
	else{out.println("<div class='res_1' style='width:200px; padding-top: -20px; align:center; margin: 10px 20px 10px 10px;'>No Results found! Try a New Search</div>");}

out.println("<div id='author' style='margin-left:870px; margin-top:-587px;'>");
 
ArrayList<String> sal = (ArrayList<String>) request.getAttribute("Search_Author");
int j = 1;
if ((sal != null) && (!sal.isEmpty())) {
	ListIterator<String> li0 = sal.listIterator();
	String auth_res = null;
	out.println("<table id='table1' class='border_1' width='500px;'>");
		out.println("<tr>");
			out.println("<td colspan=2>");
				out.println("<span class='font_h2' style='width:200px;'>Results for Author Search</span> ");
			out.println("</td>");
		out.println("</tr>");
		while (li0.hasNext()) {
			auth_res = (String) li0.next();
		out.println("<tr>");
		out.println("<td class='border_2'>");
			out.println("<input type='checkbox' class='message_checkbox' name='auth_text" + j + "' id='auth_text" + j + "' value='"+auth_res+"'> ");
		out.println("</td>");
		out.println("<td class='border_2'>");
			out.println("<span class='table_content' name='auth_span"+j+"' id='auth_span"+j+"' style='width:200px;'>"+auth_res+"</span>");
		out.println("</td>");
	out.println("</tr>");
	j++;
		}
		out.println("<tr>");
			out.println("<td colspan=2 class='border_2'>");
				out.println("<input type='button' value='OK' onclick='return fill_author()' style='width: 500px; margin: 10px 20px 10px 10px;'/>");
			out.println("</td>");
		out.println("</tr>");
	out.println("</table>");
}else{}

%>
</div>	
</form>
</body>
</html>