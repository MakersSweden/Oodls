$(function () {
    $("#new_donor #donor_organisation").on('blur', function () {
        var term = $("#new_donor #donor_organisation").val();
        if (term.trim() == "") return;

        var url = '/eniro_validation?term=' + term;
        $('#donor_organisation').addClass('loadinggif');
        $("#organisations").find("tbody").empty();
        $("#new_donor :input").prop("disabled", true);

        $.getJSON(url, function (data) {
            $('#resultsModal').foundation('reveal', 'open');
            window.organisations = data;
            $.each(data, function (index) {
                $("#organisations").find("tbody")
                    .append($("<tr>")
                        .append($("<td>").text(this.companyName))
                        .append($("<td>").text(this.streetName))
                        .append($("<td>").text(this.city))
                        .append($("<td>").text(this.postCode))
                        .append($("<td class='show-for-large-up'>").text(this.orgNumber))
                        .append($("<td>")
                            .append($("<a>")
                                .attr('href', 'javascript:void(0)')
                                .attr('id', 'orgSelect')
                                .attr('class', 'tiny button')
                                .attr('data-org-id', index)
                                .text("Select"))))
            });
            $('#donor_organisation').removeClass('loadinggif');
            $("#new_donor :input").prop("disabled", false);

            $("#organisations #orgSelect").on('click', function () {
                var index = parseInt($(this).data('org-id'));
                var org = window.organisations[index];
                $('#resultsModal').foundation('reveal', 'close');
                $("#donor_organisation").val(org.companyName);
                $("#donor_address").val(org.streetName);
                $("#donor_city").val(org.city);
                $("#donor_postcode").val(org.postCode);
                if (org.website.trim() != "") {
                    $("#donor_website_url").val(org.website);
                    $("#new_donor #donor_website_url").prop("disabled", true);
                }
                $("#new_donor .location_info :input").prop("disabled", true);
            });
        });
    });

});
