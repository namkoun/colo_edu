<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/tagLibs.jsp" %>

<!-- JQGrid -->
<link rel="stylesheet" href="${contextPath}/assets/js/plugin/jqgrid/css/ui.jqgrid.css" />
<link rel="stylesheet" href="${contextPath}/assets/js/plugin/jqgrid/css/jquery-ui.min.css" />
<script src="${contextPath}/assets/js/plugin/jqgrid/js/i18n/grid.locale-kr.js" type="text/javascript"></script>
<script src="${contextPath}/assets/js/plugin/jqgrid/js/minified/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="${contextPath}/assets/js/plugin/jqgrid/js/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $.jgrid.no_legacy_api = true;
    $.jgrid.useJSON = true;
</script>  
<!-- DataTables -->
<script type="text/javascript" src="${contextPath}/assets/js/plugin/datatable/datatable.js"></script>
<script type="text/javascript" src="${contextPath}/assets/js/plugin/datatable/datatable.jquery.min.js"></script>
