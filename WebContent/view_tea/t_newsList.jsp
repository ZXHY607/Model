<%@page import="net.gslab.entity.News"%>
<%@page import="net.gslab.setting.PageBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String uri="/Model/news/getPage";
	String params[]={};
	String[] paramNames={};
%>
	<table><tr><th>ID</th><th>标题</th><th></th><th>时间</th></tr>
	<%
	PageBean pb=(PageBean)request.getAttribute("pageBean"); 
	if(pb!=null)
	{
		List<News> list=pb.getData();
		for(int i=0;i<list.size();i++)
		{
			News m=list.get(i);%>
	
	<tr><td><%= m.getNewsId()%></td>
	<td><%=m.getNewsName() %></td>
	<td><%=m.getPublishDate()%></td>
	
	</tr>
	
	<%}}%>
	</table>
	<div class="btmcontent clearfix">
            
            <form class="pgsch clearfix" action=<%=uri%> ><button class="pggo">转到</button><input type="text" class="pgparam" name="pg">页</form>
              <div class="changepage">
              <a class="fsp" href="<%=pb.getFirstPage(uri,paramNames,params)%>">首页</a>
              <a class="prp" href="<%=pb.getPrePage(uri,paramNames,params)%>">上一页</a>
              <a class="pgnum"><%=pb.getPageIndex() %>/<%=pb.getMxIndex() %></a>
              <a class="nxp" href="<%=pb.getNextPage(uri,paramNames,params)%>">下一页</a>
              <a class="lsp" href="<%=pb.getLastPage(uri,paramNames,params)%>">尾页</a>
            </div>
     </div>
</body>
</html>