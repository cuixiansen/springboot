<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
		<title></title>
 <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrapValidator.css" rel="stylesheet">
   
      <script src="javascript/jQuery-1.12.4.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="javascript/bootstrapValidator.js"></script>



</head>
<!--  <script type="text/javascript">
if(top.location != self.location){
	top.location="fraemm.jsp"
}




</script>-->
<body>
<!--<div>  <h3>在线人数：${onlinenum }</h3></div> -->
<div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="page-header">
                        <h2>登录系统</h2>
                    </div>

                    <form id="defaultForm" method="post" class="form-horizontal" action="loginadmin">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">name</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="username" placeholder="请输入用户名" />
                                <span class="help-block" id="firstNameMessage" />
                            </div>
                        
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">password</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="password" />
                            </div>
                        </div>
                         
                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="submit" class="btn btn-primary">登录</button>
                            </div>
                        </div>
                        
                           <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <input type="checkbox" name="remeber"  value="1">记住我</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <!-- :form -->
        </div>
    </div>

<script type="text/javascript">
$(document).ready(function() {
    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
           username: {
                container: '#firstNameMessage',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    }
                }
            },
          password: {
                message: 'The password is not valid',
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 11,
                        message:' 密码不正确'
                    }
                }
            }
        }
    });
});
</script>

<!--  <form action="login">
<table >
<tr>
  <td>姓名</td><td><input type="text" name="username" placeholder="请输入用户字段" /></td>
</tr>
<tr>
  <td>密码</td><td><input type="text" name="password" placeholder="请输入用户密码" /></td>
</tr>

<tr>
  <td colspan="2"><input type="submit" value="登录"    /><input type="reset" value="重置"    /></td>
</tr>
<tr>
  <td colspan="2"><input type="submit" value="keeponemin"  name="1"  /></td>
</tr>
<tr>
  <td colspan="2"><input type="submit" value="keeponeday"  name="1"  /></td>
</tr>
<tr>
  <td colspan="2"><input type="submit" value="keeponeyear"  name="1"  /></td>
</tr>
</table>
</form>-->

</body>
</html>