$(function() {
  $("#donor_organisation").on('blur', function(){
    var term =  $("#donor_organisation").val();
    if(term.trim() == "") return;

    var url = '/eniro_validation?term=' + term;
    $('.spinner').css("opacity", "1");
    $('#resultsModal').foundation('reveal', 'open');

    $.getJSON(url, function(data) {
      window.organisations = data;
      $.each(data, function(index) {
        $("#organisations").find("tbody")
          .append($("<tr>")
            .append($("<td>").text(this.companyName))
            .append($("<td>").text(this.streetName))
            .append($("<td>").text(this.city))
            .append($("<td>").text(this.postCode))
            .append($("<td>").text(this.orgNumber))
            .append($("<td>")
              .append($("<a>")
                .attr('href', 'javascript:void(0)')
                .attr('id', 'orgSelect')
                .attr('data-org-id', index)
                .text("Select"))))
      });
      $('.spinner').css("opacity", "0");

      $("#organisations #orgSelect").on('click', function() {
        var index = parseInt($(this).data('org-id'));
        var org = window.organisations[index];
        $('#resultsModal').foundation('reveal', 'close');
        $("#donor_address").val(org.streetName);
        $("#donor_city").val(org.city);
        $("#donor_postcode").val(org.postCode);
        if(org.website.trim() != "") {
          $("#donor_website_url").val(org.website);
          $("#new_donor #donor_website_url").prop("disabled", true);
        }
        $("#new_donor .location_info :input").prop("disabled", true);
      });
    });
  });

});
