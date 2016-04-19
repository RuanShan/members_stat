$(function(){
  $('div.datepicker-container').datepicker({
    multidate: true,
    toggleActive: true
  }).datepicker('setDates',$.map(g_days, function( day){ return new Date(day)})).on('changeDate', function(e) {
     console.debug( e )
    if( _.find(e.dates,function(date){ return !( date>e.date || date<e.date) })  ){
      $.ajax({
          type: "post",
          url: "/days",
          data: { "day[free_date]": e.date},
          dataType: "json",
          success: function(data){
            //alert( 'yes...')
          }
      });
    }else{
      $.ajax({
          type: "post",
          url: "/days",
          data: { "day[free_date]": e.date},
          dataType: "json",
          success: function(data){
            //alert( 'yes...')
          }
      });
    }
    //console.debug( e.dates ) // selected dates
  })
  // day is seconds since  GMT 时间 1970 年 1 月 1 日
  // javascript require 毫秒值
   //var g_js_dates = $.map(g_days, function( day){ return new Date(day)})
   //$('div.datepicker-container').datepicker('setDates',g_js_dates);
})
