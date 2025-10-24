
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


$(document).ready(function () {
    restrictInput({ targetId: "quoteName", type: "text", maxLength: 50 });
    restrictInput({ targetId: "quotePhone", type: "number", maxLength: 10 }); // assuming 10 digit phone
    restrictInput({ targetId: "projectBudget", type: "decimal", maxLength: 8, minValue: 0 });
    restrictInput({ targetId: "otherContacts", type: "varchar", maxLength: 50 });
});

