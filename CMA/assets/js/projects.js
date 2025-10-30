
function loadProjects(clientCode) {
    $.ajax({
        type: "POST",
        url: "/Pages/Projects.aspx/GetTempProjectList",
        data: JSON.stringify({ clientCode: clientCode }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            const tableBody = $("#projectListTable");
            tableBody.empty();
            const data = response.d || response;

            if (data.success && data.data.length > 0) {
                psmJs_DynamicTableGenerateTable(data, tableBody )
                });
            } else {
                tableBody.append('<tr><td colspan="100%" class="text-center">No projects found for this client.</td></tr>');
            }
        },
        error: function (err) {
            console.error(err);
            alert("Error fetching projects.");
        }
    });
}
