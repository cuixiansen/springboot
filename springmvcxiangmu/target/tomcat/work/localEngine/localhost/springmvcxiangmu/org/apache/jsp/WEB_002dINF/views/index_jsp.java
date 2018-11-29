package org.apache.jsp.WEB_002dINF.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t<meta charset=\"UTF-8\">\r\n");
      out.write("\t\t<title></title>\r\n");
      out.write(" <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    <link href=\"css/bootstrapValidator.css\" rel=\"stylesheet\">\r\n");
      out.write("   \r\n");
      out.write("      <script src=\"javascript/jQuery-1.12.4.js\"></script>\r\n");
      out.write("      <script src=\"js/bootstrap.min.js\"></script>\r\n");
      out.write("      <script src=\"javascript/bootstrapValidator.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<!--  <script type=\"text/javascript\">\r\n");
      out.write("if(top.location != self.location){\r\n");
      out.write("\ttop.location=\"fraemm.jsp\"\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>-->\r\n");
      out.write("<body>\r\n");
      out.write("<!--<div>  <h3>在线人数：");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${onlinenum }", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("</h3></div> -->\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <!-- form: -->\r\n");
      out.write("            <section>\r\n");
      out.write("                <div class=\"col-lg-8 col-lg-offset-2\">\r\n");
      out.write("                    <div class=\"page-header\">\r\n");
      out.write("                        <h2>登录系统</h2>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <form id=\"defaultForm\" method=\"post\" class=\"form-horizontal\" action=\"loginadmin\">\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <label class=\"col-lg-3 control-label\">name</label>\r\n");
      out.write("                            <div class=\"col-lg-5\">\r\n");
      out.write("                                <input type=\"text\" class=\"form-control\" name=\"username\" placeholder=\"请输入用户名\" />\r\n");
      out.write("                                <span class=\"help-block\" id=\"firstNameMessage\" />\r\n");
      out.write("                            </div>\r\n");
      out.write("                        \r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <label class=\"col-lg-3 control-label\">password</label>\r\n");
      out.write("                            <div class=\"col-lg-5\">\r\n");
      out.write("                                <input type=\"text\" class=\"form-control\" name=\"password\" />\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                         \r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <div class=\"col-lg-9 col-lg-offset-3\">\r\n");
      out.write("                                <button type=\"submit\" class=\"btn btn-primary\">登录</button>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        \r\n");
      out.write("                           <div class=\"form-group\">\r\n");
      out.write("                            <div class=\"col-lg-9 col-lg-offset-3\">\r\n");
      out.write("                                <input type=\"checkbox\" name=\"remeber\"  value=\"1\">记住我</button>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </form>\r\n");
      out.write("                </div>\r\n");
      out.write("            </section>\r\n");
      out.write("            <!-- :form -->\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("$(document).ready(function() {\r\n");
      out.write("    $('#defaultForm').bootstrapValidator({\r\n");
      out.write("        message: 'This value is not valid',\r\n");
      out.write("        feedbackIcons: {\r\n");
      out.write("            valid: 'glyphicon glyphicon-ok',\r\n");
      out.write("            invalid: 'glyphicon glyphicon-remove',\r\n");
      out.write("            validating: 'glyphicon glyphicon-refresh'\r\n");
      out.write("        },\r\n");
      out.write("        fields: {\r\n");
      out.write("           username: {\r\n");
      out.write("                container: '#firstNameMessage',\r\n");
      out.write("                validators: {\r\n");
      out.write("                    notEmpty: {\r\n");
      out.write("                        message: '用户名不能为空'\r\n");
      out.write("                    }\r\n");
      out.write("                }\r\n");
      out.write("            },\r\n");
      out.write("          password: {\r\n");
      out.write("                message: 'The password is not valid',\r\n");
      out.write("                validators: {\r\n");
      out.write("                    notEmpty: {\r\n");
      out.write("                        message: '密码不能为空'\r\n");
      out.write("                    },\r\n");
      out.write("                    stringLength: {\r\n");
      out.write("                        min: 1,\r\n");
      out.write("                        max: 11,\r\n");
      out.write("                        message:' 密码不正确'\r\n");
      out.write("                    }\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("    });\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<!--  <form action=\"login\">\r\n");
      out.write("<table >\r\n");
      out.write("<tr>\r\n");
      out.write("  <td>姓名</td><td><input type=\"text\" name=\"username\" placeholder=\"请输入用户字段\" /></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td>密码</td><td><input type=\"text\" name=\"password\" placeholder=\"请输入用户密码\" /></td>\r\n");
      out.write("</tr>\r\n");
      out.write("\r\n");
      out.write("<tr>\r\n");
      out.write("  <td colspan=\"2\"><input type=\"submit\" value=\"登录\"    /><input type=\"reset\" value=\"重置\"    /></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td colspan=\"2\"><input type=\"submit\" value=\"keeponemin\"  name=\"1\"  /></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td colspan=\"2\"><input type=\"submit\" value=\"keeponeday\"  name=\"1\"  /></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td colspan=\"2\"><input type=\"submit\" value=\"keeponeyear\"  name=\"1\"  /></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</form>-->\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
