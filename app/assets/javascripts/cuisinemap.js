
(function() {

    var oneColor = {'US': 'green', 'MX':'red', 'CA':'blue'};
    map = new jvm.WorldMap({
        map: 'world_mill_en',
        container: $('#worldmap'),
        backgroundColor: 'pink',
        series: {
            regions: [{
                attribute: 'fill'}]
        }
    });
    

    map.series.regions[0].setValues(oneColor);
    function setColor(countryCode,color){
          var country = {};
        country[countryCode] = color;
        map.series.regions[0].setValues(country);
  

    }
      
    
    $('.country').on("click", function(){
        
        var countryCode = $(this).attr("id");
        if ($(this).hasClass("unselected")){
            $(this).addClass("selected");
            $(this).removeClass("unselected");
            $('body').append("Selected--Yellow"); 
            setColor(countryCode,'yellow');
        }
        else
        {
            $(this).addClass("unselected");
            $(this).removeClass("selected");
            $('body').append("Unselected -- Gray"); 
            setColor(countryCode,'gray');
        }
  
    });
    
})();

