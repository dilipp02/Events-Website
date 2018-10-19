<%@page import="eventPack.eventList"%>
<%@page import="eventPack.NewEventData"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="enrollmentStyle.css">
</head>
<body>
    <%
        String user = (String)session.getAttribute("user");
        String organiser = (String)session.getAttribute("organiser");
        if(user.equals(""))
        {
    %>
        <h4 style="color: red">login is mandatory for enrollment</h4>
    <%
        }
        ArrayList<NewEventData> eventList;
        eventList eventData = new eventList();
        eventList = eventData.getEventList();
        String eventCategory = (String)session.getAttribute("eventCategory");
        for (int i = 0; i < eventList.size(); i++)
        {
            if(eventCategory.equals("social") && eventList.get(i).getEventCategory().equals("social"))
            {
    %>
            <div class="collapsible1"><%=eventList.get(i).getName()%><br>
                <span class="glyphicon glyphicon-calendar"></span>
                <%=eventList.get(i).getDate()%>
            </div>
            <form class="collapsible" action="paymentReceipt.jsp">
                <%
                    if(!user.equals(""))
                    {
                %>
                    <button class="button" name="event" value="<%=eventList.get(i).getE_id()%>" style="float:right; margin-top: -19px;"><span>ENROLL </span></button>
                <%
                    }
                %>
            </form>
            <div class="content"><br>
                <%=eventList.get(i).getDescription()%>
            </div>
    <%
            }
            else if(eventCategory.equals("technical") && eventList.get(i).getEventCategory().equals("technical"))
            {
    %>
            <div class="collapsible1"><%=eventList.get(i).getName()%><br>
                <span class="glyphicon glyphicon-calendar"></span>
                <%=eventList.get(i).getDate()%>
            </div>
            <form class="collapsible" action="paymentReceipt.jsp">
                <%
                    if(!user.equals(""))
                    {
                %>
                    <button class="button" name="event" value="<%=eventList.get(i).getE_id()%>" style="float:right; margin-top: -19px;"><span>ENROLL </span></button>
                <%
                    }
                %>
            </form>
            <div class="content"><br>
                <%=eventList.get(i).getDescription()%>
            </div>
    <%
            }
            else if(eventCategory.equals("cultural") && eventList.get(i).getEventCategory().equals("cultural"))
            {
    %>
            <div class="collapsible1"><%=eventList.get(i).getName()%><br>
                <span class="glyphicon glyphicon-calendar"></span>
                <%=eventList.get(i).getDate()%>
            </div>
            <form class="collapsible" action="paymentReceipt.jsp">
                <%
                    if(!user.equals(""))
                    {
                %>
                    <button class="button" name="event" value="<%=eventList.get(i).getE_id()%>" style="float:right; margin-top: -19px;"><span>ENROLL </span></button>
                <%
                    }
                %>            
            </form>
            <div class="content"><br>
                <%=eventList.get(i).getDescription()%>
            </div>
    <%
            }
            else if(eventCategory.equals("sports") && eventList.get(i).getEventCategory().equals("sports"))
            {
    %>
            <div class="collapsible1"><%=eventList.get(i).getName()%><br>
                <span class="glyphicon glyphicon-calendar"></span>
                <%=eventList.get(i).getDate()%>
            </div>
            <form class="collapsible" action="paymentReceipt.jsp">
                <%
                    if(!user.equals(""))
                    {
                %>
                    <button class="button" name="event" value="<%=eventList.get(i).getE_id()%>" style="float:right; margin-top: -19px;"><span>ENROLL </span></button>
                <%
                    }
                %>            
            </form>
            <div class="content"><br>
                <%=eventList.get(i).getDescription()%>
            </div>
    <%
            }
        }
    %>
    <script>
    var coll = document.getElementsByClassName("collapsible");
    var i;

    for (i = 0; i < coll.length; i++) {
      coll[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var content = this.nextElementSibling;
        if (content.style.maxHeight){
          content.style.maxHeight = null;
        } else {
          content.style.maxHeight = content.scrollHeight + "px";
        } 
      });
    }
    </script>
</body>
</html>