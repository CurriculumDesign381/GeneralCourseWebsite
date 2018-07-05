<%@page import="cqut.dao.ContentManageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="cqut.dao.ContentManageDao,java.util.List, java.util.Map,java.util.Random"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页中部</title>
<link type="text/css" href="../css/homePageCenter.css" rel="stylesheet" />
<script src="../js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="../js/homePageCenter.js" type="text/javascript"></script>
</head>
<%List<Map<String,Object>> list =ContentManageDao.getContentManageDao().selectInforFromArcticle2();
java.util.Random r=new java.util.Random(list.size()-1); 
int number = new Random().nextInt(list.size()-1);
System.out.print(list.get(number).get("arcticleContent"));
%>
<body>
    <div class="midContent">
       <div class="midHead">
            <div class="midHeadLeft">
                <div class="subjectIntroduce">
                    <div class="titleIntroduce">
                        <a href="#"><img src="../Images/images/title_icon.png" width="5" height="19" /></a>
                        <a href="#"><span class="allTitleChinese">课程介绍</span></a>
                        <span class="allTitleEnglish">Introduce</span>
                    </div>
                    <div class="midHeadHr"></div>
                    <div class="contentIntroduce">                  
                      <!--   <div class="contentIntroduceLeft">
                             <a href="#"><img src="../Images/images/课程负责人.png" width="169" height="164"/></a>
                        </div> -->
                        <div class="contentIntroduceRight"><%=list.get(number).get("arcticleContent") %></div>
                    
                    </div>
                </div>
            </div>
            
            
            <div class="midHeadRight">
            
                <div class="subjectPrincipal">
                    <div class="titlePrincipal">
                        <a href="#"><img src="../Images/images/title_icon.png" width="5" height="19" /></a>
                        <a href="#"> <span class="allTitleChinese">课程负责人</span></a>
                        <span class="allTitleEnglish">Principal</span>
                    </div>
                    
                  
                    <div class="contentPrincipal">
                       <!--  <div class="contentPrincipalLeft">
                            <a href="#"><img src="../Images/images/课程通知.png" width="131" height="164"/></a>
                        </div> -->
                        <div class="contentPrincipalRight"><%=list.get(number).get("Anthor") %><%=list.get(number).get("AnthorInfor") %></div>
                    
                    </div>
                </div>
            </div>
            
       </div>
       
       
       
       <div class="midMid">
             <div class="midMidLeft">
                <div class="subjectTrends">
                   <div class="subjectTrendsLeft"></div>
                   <div class="subjectTrendsMid">
                        <div class="titleTrendsMid">
                            <a href="#"><img src="../Images/images/title_icon.png" width="5" height="19" /></a>
                            <a href="#"><span class="allTitleChinese">课程动态</span></a>
                            <span class="allTitleEnglish">Introduce</span>
                            <span class="moreImg"><a href="#"><img src="../Images/images/more.png" width="31" height="7"/></a></span>
                        </div>
                        <div class="midMidHr"></div>
                        <div class="contentTrendsMid">
                            <ul>
                               <li>
                               	  <img src="../Images/images/list_icon.png" width="4" height="6"/>
                                  <a href="#">我我我我我我我我我我我哦我发的发的发我问</a> 
                                   <span class="time">2012.2.2</span> 
                               </li>
                               <li>
                               	  <img src="../Images/images/list_icon.png" width="4" height="6"/>
                                  <a href="#">我我我我我我我我我我我哦我发的发的发我问</a> 
                                   <span class="time">2012.2.2</span> 
                               </li>
                               <li>
                               	  <img src="../Images/images/list_icon.png" width="4" height="6"/>
                                  <a href="#">我我我我我我我我我我我哦我发的发的发我问</a> 
                                   <span class="time">2012.2.2</span> 
                               </li>
                               <li>
                               	  <img src="../Images/images/list_icon.png" width="4" height="6"/>
                                  <a href="#">我我我我我我我我我我我哦我发的发的发我问</a> 
                                   <span class="time">2012.2.2</span> 
                               </li><li>
                               	  <img src="../Images/images/list_icon.png" width="4" height="6"/>
                                  <a href="#">我我我我我我我我我我我哦我发的发的发我问</a> 
                                   <span class="time">2012.2.2</span> 
                               </li><li>
                               	  <img src="../Images/images/list_icon.png" width="4" height="6"/>
                                  <a href="#">我我我我我我我我我我我哦我发的发的发我问</a> 
                                   <span class="time">2012.2.2</span> 
                               </li>
                               
                               
                            
                            </ul>
                        
                        </div>
                   
        
                  
                </div>
                   <div class="subjectTrendsRight"></div>
                 </div>
            </div>
            
            
            <div class="midMidRight">
       <div class="studySource">
                   <div class="studySourceLeft"></div>
                   <div class="studySourceMid">
                        <div class="titleStudySourceMid">
                            <a href="#"><img src="../Images/images/title_icon.png" width="5" height="19" /></a>
                            <a href="#"><span class="allTitleChinese">教学资源</span></a>
                            <span class="allTitleEnglish">Resource</span>
                        </div>
                        <div class="midMidHr"></div>
                        <div class="contentStudySourceMid">
                           <a href="#"><img src="../Images/images/教学课件.png" height="101" width="156"/></a>
                           <a href="#"><img src="../Images/images/教学视频.png" height="101" width="145"/></a>
                        
                        </div>     
                </div>
                   <div class="studySourceRight"></div>
                 </div>
            </div>
       
       
       
       
       </div>
       <div class="midFoot">
          <div class="midFootMain">
              <div class="midFootTitle">
                    <a href="#"><img src="../Images/images/title_icon.png" width="5" height="19" /></a>
                    <a href="#"><span class="allTitleChinese">教学资源</span></a>
                    <span class="allTitleEnglish">Resource</span>
              </div>
              <div class="midFootContent">
                  <div class="midFootContentLeft" id="left_scroll">
                      <a href="javascript:void(0)"><img src="../Images/images/team_bt_left.png" height="67" width="12"/></a>
                  </div>
                  <div class="midFootContentMid">
                      <div class="midContentImg" id="carousel_inner">
                          <ul id="carousel_ul">
                              <li class="trendsImg"><a href="javascript:void(0)"><img src="../Images/images/课程负责人.png"/></a></li>
                              <li class="trendsImg"><a href="javascript:void(0)"><img src="../Images/images/课程负责人.png"/></a></li>
                              <li class="trendsImg"><a href="javascript:void(0)"><img src="../Images/images/kejian.png"/></a></li>
                              <li class="trendsImg"><a href="javascript:void(0)"><img src="../Images/images/课程负责人.png"/></a></li>
							  <li class="trendsImg"><a href="javascript:void(0)"><img src="../Images/images/kejian.png"/></a></li>
							  <li class="trendsImg"><a href="javascript:void(0)"><img src="../Images/images/课程负责人.png"/></a></li>
							  <li class="trendsImg"><a href="javascript:void(0)"><img src="../Images/images/kejian.png"/></a></li>
							  <li class="trendsImg"><a href="javascript:void(0)"><img src="../Images/images/课程负责人.png"/></a></li>
							  <li class="trendsImg"><a href="javascript:void(0)"><img src="../Images/images/kejian.png"/></a></li>
                          </ul>
                      </div>
                  </div>
                  <div class="midFootContentRight" id="right_scroll">
                     <a href="javascript:void(0)"><img src="../Images/images/team_bt_right.png" height="67" width="12"/></a>
                  </div>
              </div>
          </div>
       
       </div>
       <div class="friendShipConnection">
            <div class="friendShipTitle">
                <img src="../Images/images/youqinglianjie.png" width="24" height="19"/>
                <span class="friendShipWords">友情链接：</span>
                <span>
                    <ul>
                        <li><a href="#">数据库学习网站</a></li>
                        <li><a href="#">数据库学习网站</a></li>
                        <li><a href="#">数据库学习网站</a></li>
                        <li><a href="#">数据库学习网站</a></li>
                    </ul>
                </span>
            </div>

       </div>
    
    </div>

</body>
</html>
