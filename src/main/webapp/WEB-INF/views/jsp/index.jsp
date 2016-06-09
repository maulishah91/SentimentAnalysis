<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<head>
<title>Sentiment Analysis</title>  
<!-- D3 related scripts -->
<spring:url value="/resources/core/files/time_chart.json" var="time_chart_json" />
<spring:url value="/resources/core/js/topojson.v1.min.js" var="topojson" />
<spring:url value="/resources/core/js/d3.geo.projection.v0.min.js" var="geo" />
<spring:url value="/resources/core/js/vega.js" var="vega" />
<script>var pageName='#timeSeries';</script>
<%@include file="navigation.jsp" %>
   
<script src="${topojson}"></script>
<script src="${geo}" charset="utf-8"></script>
<script src="${vega}"></script>  


<script type="text/javascript">


// parse a spec and create a visualization view
function parse(spec) {
  vg.parse.spec(spec, function(chart) { chart({el:"#showTimeSeries"}).height(400).width(650).update(); });
}
parse("${time_chart_json}");

</script>
</head>
<body>
<div class="container">
    <div class="row">
<section class="content">
            <div class="col-md-8 col-md-offset-4">
                

               <div class="form-group">
                          
                          <select class="form-control" id="college1" style="width:100px;float:left;margin:10px;">
                            <option>UCLA</option>
                            <option>Stanford</option>
                          </select>
                         <span style="float:left;margin:10px;">Versus </span>
                          <select class="form-control" id="college2" style="width:100px;float:left;margin:10px;">
                            <option>USC</option>
                          </select>
                        </div>
                    <br/><br/> 
            </div>
                <br/><br/><br/><br/>
                <div class="col-md-6 col-md-offset-2">
                      <div id="showTimeSeries"></div>     </div>       
</section>

</div></div>

<%@include file="footer.jsp"%>

</body>
