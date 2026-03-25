using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MediCare.Views
{
    public partial class MedicinesDetails : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize default values if needed
                ddlMedicineType.SelectedIndex = 0;
                ddlCategory.SelectedIndex = 0;
                ddlPrescriptionRequired.SelectedIndex = 0;
                ddlStorage.SelectedIndex = 0;
            }
        }

        protected void lbtnScanBarcode_Click(object sender, EventArgs e)
        {
            try
            {
                // Example: You might want to open a barcode scanner dialog or integrate with a scanner API
                // For demonstration, let's assume the scanned barcode is returned from some method
                string scannedBarcode = ScanBarcodeFromDevice(); // You need to implement this logic

                if (!string.IsNullOrEmpty(scannedBarcode))
                {
                    txtBarcode.Text = scannedBarcode;
                    string lblMessagText = "Barcode scanned successfully!";
                }
                else
                {
                    string lblMessagText = "Failed to scan barcode. Please try again.";
                }
            }
            catch (Exception ex)
            {
                string lblMessagText = "Error scanning barcode: " + ex.Message;
            }
        }

        // Dummy method for demonstration
        private string ScanBarcodeFromDevice()
        {
            // Replace this with actual barcode scanning integration
            // For now, returning a dummy barcode
            return "1234567890123";
        }


        // Reset all form fields
        protected void lbtnReset_Click(object sender, EventArgs e)
        {
            txtMedicineName.Text = "";
            txtGenericName.Text = "";
            txtBrandName.Text = "";
            ddlMedicineType.SelectedIndex = 0;
            txtStrength.Text = "";
            ddlStrengthUnit.SelectedIndex = 0;
            txtPackageSize.Text = "";
            ddlPackageUnit.SelectedIndex = 0;

            ddlCategory.SelectedIndex = 0;
            ddlPrescriptionRequired.SelectedIndex = 0;
            txtUses.Text = "";
            txtSideEffects.Text = "";
            txtContraindications.Text = "";
            ddlStorage.SelectedIndex = 0;
            txtManufacturer.Text = "";

            txtSKU.Text = "";
            txtBatchNumber.Text = "";
            txtExpiryDate.Text = "";
            txtInitialStock.Text = "0";
            txtMinStockLevel.Text = "10";
            txtMaxStockLevel.Text = "1000";
            txtCostPrice.Text = "0.00";
            txtSellingPrice.Text = "0.00";
            txtMRP.Text = "0.00";
            ddlSupplier.SelectedIndex = 0;
            ddlTaxRate.SelectedIndex = 1;

            txtDescription.Text = "";
            txtDosageInstructions.Text = "";
            chkIsActive.Checked = true;
            chkTrackExpiry.Checked = true;
            chkRequireBatch.Checked = false;

            // Reset file upload
            if (fuMedicineImage.HasFile)
            {
                fuMedicineImage.Dispose();
            }
        }

        // Save as draft (you can save in DB with Draft status)
        protected void lbtnSaveDraft_Click(object sender, EventArgs e)
        {
            // Example: Save data in database with Status='Draft'
            // You can use your data access layer / stored procedures here

            string medicineName = txtMedicineName.Text.Trim();
            string genericName = txtGenericName.Text.Trim();
            string brandName = txtBrandName.Text.Trim();
            string medicineType = ddlMedicineType.SelectedValue;
            string strength = txtStrength.Text.Trim();
            string strengthUnit = ddlStrengthUnit.SelectedValue;

            // Example: Save to DB logic here...
            // SaveDraftMedicine(medicineName, genericName, brandName, medicineType, strength, strengthUnit, ...);

            // Show confirmation
            string lblMessagText = "Medicine saved as draft successfully.";

        }

        // Add Medicine (final save)
        protected void lbtnAddMedicine_Click(object sender, EventArgs e)
        {
            try
            {
                // Collect form data
                string medicineName = txtMedicineName.Text.Trim();
                string genericName = txtGenericName.Text.Trim();
                string brandName = txtBrandName.Text.Trim();
                string medicineType = ddlMedicineType.SelectedValue;
                string strength = txtStrength.Text.Trim();
                string strengthUnit = ddlStrengthUnit.SelectedValue;
                string packageSize = txtPackageSize.Text.Trim();
                string packageUnit = ddlPackageUnit.SelectedValue;

                string category = ddlCategory.SelectedValue;
                string prescriptionRequired = ddlPrescriptionRequired.SelectedValue;
                string uses = txtUses.Text.Trim();
                string sideEffects = txtSideEffects.Text.Trim();
                string contraindications = txtContraindications.Text.Trim();
                string storage = ddlStorage.SelectedValue;
                string manufacturer = txtManufacturer.Text.Trim();

                string sku = txtSKU.Text.Trim();
                string batchNumber = txtBatchNumber.Text.Trim();
                DateTime expiryDate = Convert.ToDateTime(txtExpiryDate.Text);
                int initialStock = Convert.ToInt32(txtInitialStock.Text);
                int minStockLevel = Convert.ToInt32(txtMinStockLevel.Text);
                int maxStockLevel = Convert.ToInt32(txtMaxStockLevel.Text);
                decimal costPrice = Convert.ToDecimal(txtCostPrice.Text);
                decimal sellingPrice = Convert.ToDecimal(txtSellingPrice.Text);
                decimal mrp = Convert.ToDecimal(txtMRP.Text);
                string supplier = ddlSupplier.SelectedValue;
                string taxRate = ddlTaxRate.SelectedValue;

                string description = txtDescription.Text.Trim();
                string dosage = txtDosageInstructions.Text.Trim();
                bool isActive = chkIsActive.Checked;
                bool trackExpiry = chkTrackExpiry.Checked;
                bool requireBatch = chkRequireBatch.Checked;

                // Handle file upload
                string imagePath = "";
                if (fuMedicineImage.HasFile)
                {
                    string fileName = System.IO.Path.GetFileName(fuMedicineImage.FileName);
                    imagePath = Server.MapPath("~/uploads/medicine/" + fileName);
                    fuMedicineImage.SaveAs(imagePath);
                }

                // Save to database here using your data access layer / stored procedures
                // Example: SaveMedicine(medicineName, genericName, brandName, ..., imagePath, ...);

                string lblMessagText = "Medicine added successfully!";


                // Optionally reset form after saving
                lbtnReset_Click(sender, e);
            }
            catch (Exception ex)
            {
                string lblMessagText = "Error: " + ex.Message;
            }
        }
    }
}