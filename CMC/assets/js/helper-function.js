
/**
 * Restrict input based on type, length, min, max
 * @param {string} targetId - ID of the input
 * @param {string} type - 'number', 'decimal', 'text', 'varchar'
 * @param {number} maxLength - Maximum allowed characters/digits
 * @param {number} minValue - Minimum value (number/decimal)
 * @param {number} maxValue - Maximum value (number/decimal)
 */
function restrictInput({ targetId, type, maxLength, minValue, maxValue }) {
    const $el = $("#" + targetId);

    $el.on("input", function () {
        let val = $(this).val();

        switch (type) {
            case "number":
                val = val.replace(/\D/g, ""); // digits only
                if (maxLength) val = val.slice(0, maxLength);
                if (val) {
                    let numVal = parseInt(val, 10);
                    if (minValue !== undefined && numVal < minValue) numVal = minValue;
                    if (maxValue !== undefined && numVal > maxValue) numVal = maxValue;
                    val = numVal;
                }
                break;

            case "decimal":
                val = val.replace(/[^0-9.]/g, ""); // digits + dot
                val = val.replace(/(\..*?)\..*/g, "$1"); // only one dot
                if (maxLength) val = val.slice(0, maxLength);
                if (val) {
                    let numVal = parseFloat(val);
                    if (minValue !== undefined && numVal < minValue) numVal = minValue;
                    if (maxValue !== undefined && numVal > maxValue) numVal = maxValue;
                    val = numVal;
                }
                break;

            case "text":
                val = val.replace(/[^a-zA-Z\s]/g, ""); // letters + spaces
                if (maxLength) val = val.slice(0, maxLength);
                break;

            case "varchar":
                val = val.replace(/[^a-zA-Z0-9\s.,@_-]/g, ""); // letters, digits, space, .,@,_-
                if (maxLength) val = val.slice(0, maxLength);
                break;

            default:
                // fallback: do nothing
                break;
        }

        $(this).val(val);
    });
}

function showAlert(message, type = 'info') {
    const alertClass = {
        'success': 'alert-success',
        'error': 'alert-danger',
        'warning': 'alert-warning',
        'info': 'alert-info'
    }[type] || 'alert-info';

    const alertHtml = `
            <div class="alert ${alertClass} alert-dismissible fade show position-fixed top-0 end-0 m-3" style="z-index: 1060;">
                ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        `;

    $('body').append(alertHtml);

    setTimeout(() => {
        $('.alert').alert('close');
    }, 5000);
}

function preventDefaultButton() {
    // Use event delegation on the document to cover dynamically added buttons too
    $(document).on('click', 'button', function (e) {
        e.preventDefault();   // Prevent default action (like form submit)
        e.stopPropagation();  // Stop event bubbling
        // Optional: you can add a console.log for debugging
        // console.log('Button click prevented:', this);
    });
}



 

function psmJs_checkSessionAndLoader(loginFieldId = '<%= hdnLoginId.ClientID %>', roleFieldId = '<%= hdnRoleId.ClientID %>') {
    /* Old approach to show laoder
    $(document).ajaxStart(function () {
        psmJs_checkUserSession();
        psmJs_showLoader();
    });

    $(document).ajaxStop(function () {
        psmJs_hideLoader();
    });
    */

    // Unbind previous event handlers to avoid duplicates
    $(document).off('ajaxStart.ajaxSession').on('ajaxStart.ajaxSession', function () {
        psmJs_checkUserSession(loginFieldId, roleFieldId);
        psmJs_showLoader();
    });

    $(document).off('ajaxStop.ajaxSession').on('ajaxStop.ajaxSession', function () {
        psmJs_hideLoader();
    });


}

function psmJs_checkUserSession(loginFieldId = '<%= hdnLoginId.ClientID %>', roleFieldId = '<%= hdnRoleId.ClientID %>') {
    const loginId = $('#' + loginFieldId).val();
    const roleId = $('#' + roleFieldId).val();
    if (!loginId || !roleId) {
        alert("Session expired or invalid. Please Login");
        window.location.href = 'https://www.wealthmaker.in/login_new.aspx';
    }
}


function psmJs_showLoader() {
    if ($('#customLoader').length) {
        $('#customLoader').show();
        return;
    }

    const loaderHtml = `
    <div id="customLoader" style="
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0,0,0,0.2);
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 9999;">
        <div style="
            background-color: white;
            color: #B78939;
            padding: 20px 30px;
            width: 250px;
            text-align: center;
            border-radius: 5px;
            font-weight: bold;
            font-size: 16px;">
            Please wait... 
        </div>
    </div>
`;
    $('body').append(loaderHtml);
}

function psmJs_hideLoader() {
    $('#customLoader').fadeOut(300, function () {
        $(this).remove();
    });
}


function psmJs_bsmDraggable() {
    // make boostrap modal draggable, boostrapmodaldraggable
    $(document).on('shown.bs.modal', '.modal', function () {
        var $modal = $(this);
        var $dialog = $modal.find('.modal-dialog');
        var $header = $modal.find('.modal-header');

        if ($header.length === 0) return; // needs header to drag

        let isDragging = false, startX = 0, startY = 0, origX = 0, origY = 0;

        $header.css('cursor', 'move');

        $header.off('mousedown.modaldrag').on('mousedown.modaldrag', function (e) {
            isDragging = true;
            startX = e.clientX;
            startY = e.clientY;

            // current offset of modal-dialog
            const rect = $dialog[0].getBoundingClientRect();
            origX = rect.left;
            origY = rect.top;

            // disable Bootstrap centering transform
            $dialog.css('transform', 'none');
            e.preventDefault();
        });

        $(document).off('mousemove.modaldrag').on('mousemove.modaldrag', function (e) {
            if (!isDragging) return;

            let dx = e.clientX - startX;
            let dy = e.clientY - startY;

            $dialog.css({
                position: 'absolute',
                margin: 0,
                left: origX + dx,
                top: origY + dy
            });
        });

        $(document).off('mouseup.modaldrag').on('mouseup.modaldrag', function () {
            isDragging = false;
        });

        // reset position when modal closes
        $modal.off('hidden.bs.modal.dragreset').on('hidden.bs.modal.dragreset', function () {
            $dialog.attr('style', ''); // reset all inline styles
        });
    });
}


function psmJs_DynamicTableGenerateTable(data, targetTable, options = {}) {
    const {
        countElement = null,
        defaultColumnWidth = null,
        adjustableColumns = false,
        tableClass = 'table-striped table-bordered',
        displayNoneToTheseColumns = ''

    } = options;

    // Get the target table element
    const table = $(targetTable);

    table.empty();

    if (data.data && data.data.length > 0) {
        if (countElement) {
            $(countElement).text(data.totalCount || data.data.length);
        }

        // Create table structure
        let headerRow = $('<tr>');
        let tableBody = $('<tbody>');

        // Create table header
        if (data.schema && data.schema.length > 0) {
            data.schema.forEach(function (column) {
                let th = $('<th>').text(column.columnName);
                if (defaultColumnWidth) {
                    th.addClass('width', defaultColumnWidth);
                }
                headerRow.append(th);
            });
        } else if (data.data.length > 0) {
            // Fallback: use keys from first data item
            Object.keys(data.data[0]).forEach(function (key) {
                let th = $('<th>').text(key);
                if (defaultColumnWidth) {
                    th.addClass('width', defaultColumnWidth);
                }
                headerRow.append(th);
            });
        }

        // Create table body rows
        data.data.forEach(function (row) {
            let tr = $('<tr>');
            Object.values(row).forEach(function (value) {
                tr.append($('<td>').text(value !== null ? value : ''));
            });
            tableBody.append(tr);
        });

        // Add header to thead and append to table
        table.append($('<thead>').append(headerRow));
        table.append(tableBody);
        //table.addClass(tableClass);

        // Make columns adjustable if enabled
        if (adjustableColumns) {
            var newName = targetTable;
            psmJs_DynamicTableMakeResizable(targetTable);
        }
        psmJs_DynamicTableStyle(targetTable);
        psmJs_DynamicTableColVisible(targetTable, options);

    } else {
        table.html('<tbody><tr><td colspan="100%" class="no-results">No records found matching your criteria</td></tr></tbody>');
        $(countElement).text('');

    }

    function psmJs_DynamicTableStyle(targetId) {

        const styleId = 'dynamic-custom-style';
        if (!document.getElementById(styleId)) {
            const styles = `
                            .error-message {
                                display: block;
                                margin-top: 2px;
                                font-size: 12px;
                                /* Small and compact */
                                color: red;
                            }


                            .draggable {
                                cursor: move;
                            }

                            .print-table {
                                width: 100%;
                                border-collapse: collapse;
                                border: 1px solid #000;
                            }

                                .print-table th,
                                .print-table td {
                                    border: 1px solid #000;
                                    padding: 8px;
                                }

                                .print-table th {
                                    background-color: #f2f2f2;
                                }

                            .floating-panel {
                                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                                border-radius: 5px;
                            }

                            .client-search-section {
                                background-color: #f8f9fa;
                                padding: 15px;
                                border-radius: 5px;
                                margin-bottom: 15px;
                            }

                            th {
                                background-color: #B78939 !important;
                                color: #fff !important;
                                position: sticky;
                                top: 0;
                                z-index: 2;
                            }

                    .invalid-date {
                        border: 1px solid red !important;
                    }

                    .form-check-label {
                        margin-left: 2px !important;
                    }

                    td {
                        overflow: hidden;
                        text-overflow: ellipsis;
                        white-space: nowrap;
                        max-width: 150px;
                    }

                    ${targetId} tbody tr.row-selected > td {
                        background-color: lightblue !important;
                    }

                    ${targetId} thead tr th, #rtaGrid thead tr th {
                        position: sticky !important;
                        top: 0 !important;
                        background-color: #B78939 !important;
                        color: white !important;
                        z-index: 1;
                    }

                    .ctm_hidden {
                        display: none;
                    }
                `;

            // Inject into head
            $('<style>', {
                id: styleId,
                type: 'text/css',
                html: styles
            }).appendTo('head');
        }
    }

    function psmJs_DynamicTableColVisible(targetTable, options = {}) {

        // var displayNoneToTheseColumns = '1,2,3,4'

        const { displayNoneToTheseColumns = '' } = options;

        // Parse column numbers into an array of integers
        const hiddenColumns = displayNoneToTheseColumns
            .split(',')
            .map(c => parseInt(c.trim(), 10))
            .filter(c => !isNaN(c));

        if (hiddenColumns.length === 0) return; // nothing to hide

        const table = $(targetTable);

        // Hide headers
        table.find('thead tr th').each(function (index) {
            if (hiddenColumns.includes(index + 1)) {
                $(this).css('display', 'none');
            }
        });

        // Hide body cells
        table.find('tbody tr').each(function () {
            $(this).find('td').each(function (index) {
                if (hiddenColumns.includes(index + 1)) {
                    $(this).css('display', 'none');
                }
            });
        });
    }



}




function psmJs_DynamicTableMakeResizable(tableId) {

    if (tableId.startsWith('#')) {
        tableId = tableId.substring(1);
    }

    // Check if CSS for this tableId already exists
    if (!document.getElementById("resizableTableStyles_" + tableId)) {
        const css = `
        #${tableId} {
            table-layout: fixed;
            width: 100%;
        }

        #${tableId} th {
            width: 200px;
            position: relative;
            overflow: hidden;
        }

        #${tableId} .resizer {
            position: absolute;
            right: 0;
            top: 0;
            width: 5px;
            height: 100%;
            cursor: col-resize;
            user-select: none;
            z-index: 1;
        }

        #${tableId} th:hover .resizer {
            background-color: rgba(0, 0, 0, 0.1);
        }
    `;

        const style = document.createElement("style");
        style.id = "resizableTableStyles_" + tableId;
        style.innerHTML = css;
        document.head.appendChild(style);
    }

    const table = document.getElementById(tableId);
    const ths = table.querySelectorAll("th");

    ths.forEach(th => {
        if (!th.style.width) {
            th.style.width = th.offsetWidth + "px";
        }

        const resizer = document.createElement("div");
        resizer.classList.add("resizer");
        th.appendChild(resizer);

        let startX, startWidth;

        resizer.addEventListener("mousedown", function (e) {
            startX = e.pageX;
            startWidth = th.offsetWidth;

            function onMouseMove(e) {
                const newWidth = startWidth + (e.pageX - startX);
                th.style.width = newWidth + "px";
            }

            function onMouseUp() {
                document.removeEventListener("mousemove", onMouseMove);
                document.removeEventListener("mouseup", onMouseUp);
            }

            document.addEventListener("mousemove", onMouseMove);
            document.addEventListener("mouseup", onMouseUp);

            e.preventDefault();
        });
    });
}


function formatDotNetDate(dotNetDate) {
    if (!dotNetDate) return '';

    // Extract milliseconds from /Date(1761330600000)/
    const timestampMatch = /\/Date\((\d+)(?:[-+]\d+)?\)\//.exec(dotNetDate);
    if (!timestampMatch) return '';

    const milliseconds = parseInt(timestampMatch[1], 10);
    const date = new Date(milliseconds);

    // Format as dd/mm/yyyy
    const day = String(date.getDate()).padStart(2, '0');
    const month = String(date.getMonth() + 1).padStart(2, '0'); // Months are 0-based
    const year = date.getFullYear();

    return `${day}/${month}/${year}`;
}


$(document).ready(function () {
    restrictInput({ targetId: "quoteName", type: "text", maxLength: 50 });
    restrictInput({ targetId: "quotePhone", type: "number", maxLength: 10 }); // assuming 10 digit phone
    restrictInput({ targetId: "projectBudget", type: "decimal", maxLength: 8, minValue: 0 });
    restrictInput({ targetId: "otherContacts", type: "varchar", maxLength: 50 });

    preventDefaultButton();
});

