<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="res" uri="http://www.unidal.org/webres"%>
<%@ taglib prefix="w" uri="http://www.unidal.org/web/core"%>

<jsp:useBean id="ctx" type="com.dianping.cat.system.page.config.Context" scope="request"/>
<jsp:useBean id="payload" type="com.dianping.cat.system.page.config.Payload" scope="request"/>
<jsp:useBean id="model" type="com.dianping.cat.system.page.config.Model" scope="request"/>

<a:config>
	<res:useJs value="${res.js.local['jquery.validate.min.js']}" target="head-js" />
	<res:useJs value="${res.js.local['alarm_js']}" target="head-js" />
	<res:useJs value="${res.js.local['dependencyConfig_js']}" target="head-js" />
	<res:useCss value="${res.css.local['select2.css']}" target="head-css" />
	<res:useJs value="${res.js.local['select2.min.js']}" target="head-js" />
	<script type="text/javascript">
		$(document).ready(function() {
			$('#alert_config').addClass('active open');
			$('#systemRuleConfigList').addClass('active');
			
			var state = '${model.opState}';
			if(state=='Success'){
				$('#state').html('操作成功');
			}else{
				$('#state').html('操作失败');
			}
			setInterval(function(){
				$('#state').html('&nbsp;');
			},3000);
		});
	</script>
			<div id="ruleModal" class="modal hide fade" style="width:650px" tabindex="-1" role="dialog" aria-labelledby="ruleLabel" aria-hidden="true">
				<div class="modal-header text-center">
				    <h3 id="ruleLabel">系统规则配置</h3>
				</div>
				<div class="modal-body" id="ruleModalBody">
				</div>
				<div class="modal-footer">
				    <button class="btn btn-primary" id="ruleSubmitButton">提交</button>
				    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
				</div>
			</div>
			<table class="table table-striped table-condensed table-bordered  table-hover">
	     		<thead><tr>
	     			<th width="20%">规则id</th>
	     			<th width="26%">项目配置</th>
	     			<th width="29%">指标配置</th>
	     			<th width="4%">次数</th>
	     			<th width="7%">平均值</th>
	     			<th width="4%">总和</th>
	     			<th width="8%">操作 <a href="?op=systemRuleUpdate&key=${item.id}" class="btn btn-primary btn-xs" >
						<i class="ace-icon glyphicon glyphicon-plus bigger-120"></i></a></th>
	     		</tr></thead>
		     	<c:forEach var="item" items="${model.ruleItems}" varStatus="status">
	     			<tr>
	     			<td>${item.id}</td>
	     			<td>${item.productlineText}</td>
	     			<td>${item.metricText}</td>
	     			<td>
	     				<c:if test="${item.monitorCount}">
	     					<span class="text-danger">是</span>
	     				</c:if>
	     				<c:if test="${item.monitorCount == false}">
	     					<span>否</span>
	     				</c:if>
	     			</td>
	     			<td>
	     				<c:if test="${item.monitorAvg}">
	     					<span class="text-danger">是</span>
	     				</c:if>
	     				<c:if test="${item.monitorAvg == false}">
	     					<span>否</span>
	     				</c:if>
	     			</td>
	     			<td>
	     				<c:if test="${item.monitorSum}">
	     					<span class="text-danger">是</span>
	     				</c:if>
	     				<c:if test="${item.monitorSum == false}">
	     					<span>否</span>
	     				</c:if>
	     			</td>
			     		
					<td><a href="?op=systemRuleUpdate&key=${item.id}" class="btn btn-primary btn-xs">
						<i class="ace-icon fa fa-pencil-square-o bigger-120"></i></a>
						<a href="?op=systemRulDelete&key=${item.id}" class="btn btn-danger btn-xs delete" >
						<i class="ace-icon fa fa-trash-o bigger-120"></i></a></td>
		     		</tr>
		     	</c:forEach>
	     	</table>
</a:config>