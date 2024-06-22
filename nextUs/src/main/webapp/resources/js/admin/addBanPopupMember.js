function loadReportDetails(email) {
    $.ajax({
        url: '/loadReportDetails',
        type: 'GET',
        data: { email: email },
        success: function(reportDetails) {
            var tableBody = $('.reportTable tbody');
            tableBody.empty();
            
            console.log(reportDetails);
            if(reportDetails.length > 0) {
            	reportDetails.forEach(function(report) {
            		 var date = new Date(report.date);
                     var formattedDate = date.toLocaleDateString('ko-KR', {
                         year: '2-digit',
                         month: '2-digit',
                         day: '2-digit'
                     });
                     var formattedTime = date.toLocaleTimeString('ko-KR', {
                         hour: '2-digit',
                         minute: '2-digit'
                     });
                     
                    var row = '<tr>' +
                                '<td class="date">' +  formattedDate + ' ' + formattedTime  + '</td>' +
                                '<td>' + report.content + '</td>' +
                              '</tr>';
                    tableBody.append(row);
                });
            } else {
                var row = '<tr><td class="first" colspan="2">검색 내역이 없습니다.</td></tr>';
                tableBody.append(row);
            }
        },
        error: function(xhr, status, error) {
            console.error('Error fetching report details:', error);
        }
    });
}

$(document).ready(function() {
    // Clickable row to toggle checkbox
    $('.clickable-row').click(function(e) {
        // Avoid triggering checkbox click when clicking inside the row
        if (!$(e.target).is('input[type="checkbox"]') && !$(e.target).is('button')) {
            let checkbox = $(this).find('input[type="checkbox"]');
            checkbox.prop('checked', !checkbox.prop('checked'));
        }
    });

    // Prevent row click event when button is clicked
    $('.clickable-row button').click(function(e) {
        e.stopPropagation();
    });

    // Select all checkboxes when the header checkbox is clicked
    $('#checkAll').click(function() {
        $('input:checkbox').not(this).prop('checked', this.checked);
    });
});