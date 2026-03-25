<%@ Page Title="Cost Estimator" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cost_Estimator.aspx.cs" Inherits="CMC.Pages.Tool.Cost_Estimator" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main class="content">

        <section id="cost-estimator" class="section d-block ">
            <!-- Page Hero Section -->
            <section class="page-hero">
                <div class="container text-center">
                    <h2 class="mb-5 text-center"><i class="fas fa-hard-hat me-2"></i>Construction Cost Estimator</h2>
                    <p class="lead">Estimate the budget for residential, commercial, or renovation projects</p>
                </div>
            </section>


            <section class="ctm-tab-btn">
                <div class="container text-center">
                    <div class="calculator-tabs btn-group btn-tab-group mb-4" role="group" aria-label="Calculator tabs">
                        <button type="button" class="tab-btn btn btn-primary" data-tab="residential">Residential</button>
                        <button type="button" class="tab-btn btn btn-outline-primary" data-tab="commercial">Commercial</button>
                        <button type="button" class="tab-btn btn btn-outline-primary" data-tab="renovation">Renovation</button>
                    </div>
                </div>
            </section>


            <section class="page-content-section">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-10">
                            <div class="card glass">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="calculator-container p-4 p-md-5">
                                            <div class="tab-content" id="projectTabContent">

                                                <!-- Residential Tab -->
                                                <div class="tab-pane fade show active" id="residential" role="tabpanel" aria-labelledby="residential-tab">

                                                    <div class="text-center mb-5">
                                                        <h2 class="fw-bold section-title">Calculate Residential Construction</h2>
                                                        <p class="lead">Building your dream home from the ground up</p>
                                                    </div>

                                                    <div id="residential-form">
                                                        <div class="row mb-3">
                                                            <div class="col-md-4">
                                                                <label for="r-area" class="form-label">Total Area (sq ft)</label>
                                                                <input type="number" class="form-control" id="r-area" value="1500" min="100">
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label for="r-quality" class="form-label">Construction Quality</label>
                                                                <select class="form-select" id="r-quality">
                                                                    <option value="1200">Economy (₹1,200/sq ft)</option>
                                                                    <option value="1800" selected>Standard (₹1,800/sq ft)</option>
                                                                    <option value="2500">Premium (₹2,500/sq ft)</option>
                                                                    <option value="3500">Luxury (₹3,500/sq ft)</option>
                                                                </select>
                                                            </div>

                                                            <div class="col-md-4">
                                                                <label for="r-bedrooms" class="form-label">Number of Bedrooms</label>
                                                                <input type="number" class="form-control" id="r-bedrooms" value="3" min="1">
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label for="r-bathrooms" class="form-label">Number of Bathrooms</label>
                                                                <input type="number" class="form-control" id="r-bathrooms" value="2" min="1">
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label for="r-location" class="form-label">Location</label>
                                                                <select class="form-select" id="r-location">
                                                                    <option value="1.0" selected>Metro City</option>
                                                                    <option value="0.9">Tier 2 City</option>
                                                                    <option value="0.8">Tier 3 City</option>
                                                                    <option value="1.1">High-Cost Area</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">

                                                            <div class="col-md-12 d-flex g-4">
                                                                <label class="form-label">Additional Features: </label>
                                                                <div class="form-check ms-2">
                                                                    <input class="form-check-input" type="checkbox" id="r-garage">
                                                                    <label class="form-check-label" for="r-garage">Garage</label>
                                                                </div>
                                                                <div class="form-check ms-2">
                                                                    <input class="form-check-input" type="checkbox" id="r-garden">
                                                                    <label class="form-check-label" for="r-garden">Landscaping</label>
                                                                </div>
                                                                <div class="form-check ms-2">
                                                                    <input class="form-check-input" type="checkbox" id="r-pool">
                                                                    <label class="form-check-label" for="r-pool">Swimming Pool</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button type="button" class="btn btn-primary" id="r-calculate">Calculate Estimate</button>
                                                    </div>
                                                </div>

                                                <!-- Commercial Tab -->
                                                <div class="tab-pane fade" id="commercial" role="tabpanel" aria-labelledby="commercial-tab">
                                                    <div class="text-center mb-5">
                                                        <h2 class="fw-bold section-title">Calculate Commercial Construction</h2>
                                                        <p class="lead">Designing and building spaces for businesses that inspire growth</p>
                                                    </div>

                                                    <div id="commercial-form">
                                                        <div class="row mb-3">
                                                            <div class="col-md-4">
                                                                <label for="c-area" class="form-label">Total Area (sq ft)</label>
                                                                <input type="number" class="form-control" id="c-area" value="3000" min="100">
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label for="c-quality" class="form-label">Construction Quality</label>
                                                                <select class="form-select" id="c-quality">
                                                                    <option value="1800">Basic (₹1,800/sq ft)</option>
                                                                    <option value="2500" selected>Standard (₹2,500/sq ft)</option>
                                                                    <option value="3500">Premium (₹3,500/sq ft)</option>
                                                                    <option value="4500">High-End (₹4,500/sq ft)</option>
                                                                </select>
                                                            </div>

                                                            <div class="col-md-4">
                                                                <label for="c-floors" class="form-label">Number of Floors</label>
                                                                <input type="number" class="form-control" id="c-floors" value="2" min="1">
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label for="c-offices" class="form-label">Number of Offices/Units</label>
                                                                <input type="number" class="form-control" id="c-offices" value="5" min="1">
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label for="c-location" class="form-label">Location</label>
                                                                <select class="form-select" id="c-location">
                                                                    <option value="1.2" selected>Commercial District</option>
                                                                    <option value="1.0">Mixed Use Area</option>
                                                                    <option value="0.9">Suburban Area</option>
                                                                    <option value="1.3">Prime Location</option>
                                                                </select>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Commercial Features</label>
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="checkbox" id="c-elevator">
                                                                    <label class="form-check-label" for="c-elevator">Elevator</label>
                                                                </div>
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="checkbox" id="c-parking">
                                                                    <label class="form-check-label" for="c-parking">Parking Facility</label>
                                                                </div>
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="checkbox" id="c-ac">
                                                                    <label class="form-check-label" for="c-ac">Central AC System</label>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <button type="button" class="btn btn-primary" id="c-calculate">Calculate Estimate</button>
                                                    </div>
                                                </div>

                                                <!-- Renovation Tab -->
                                                <div class="tab-pane fade" id="renovation" role="tabpanel" aria-labelledby="renovation-tab">
                                                    <div class="text-center mb-5">
                                                        <h2 class="fw-bold section-title">Calculate Renovation Costs</h2>
                                                        <p class="lead">Transform your space with modern and efficient upgrades</p>
                                                    </div>
                                                    <div id="renovation-form">
                                                        <div class="row mb-3">
                                                            <div class="col-md-4">
                                                                <label for="rn-area" class="form-label">Total Area (sq ft)</label>
                                                                <input type="number" class="form-control" id="rn-area" value="1200" min="100">
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label for="rn-quality" class="form-label">Renovation Quality</label>
                                                                <select class="form-select" id="rn-quality">
                                                                    <option value="800">Basic (₹800/sq ft)</option>
                                                                    <option value="1200" selected>Standard (₹1,200/sq ft)</option>
                                                                    <option value="1800">Premium (₹1,800/sq ft)</option>
                                                                    <option value="2500">Luxury (₹2,500/sq ft)</option>
                                                                </select>
                                                            </div>

                                                            <div class="col-md-4">
                                                                <label for="rn-age" class="form-label">Building Age (years)</label>
                                                                <input type="number" class="form-control" id="rn-age" value="10" min="1">
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label for="rn-condition" class="form-label">Current Condition</label>
                                                                <select class="form-select" id="rn-condition">
                                                                    <option value="1.0">Good</option>
                                                                    <option value="1.2" selected>Fair</option>
                                                                    <option value="1.5">Poor</option>
                                                                    <option value="2.0">Dilapidated</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <label class="form-label">Renovation Scope</label>
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="checkbox" id="rn-kitchen" checked>
                                                                    <label class="form-check-label" for="rn-kitchen">Kitchen</label>
                                                                </div>
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="checkbox" id="rn-bathroom" checked>
                                                                    <label class="form-check-label" for="rn-bathroom">Bathroom</label>
                                                                </div>
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="checkbox" id="rn-flooring">
                                                                    <label class="form-check-label" for="rn-flooring">Flooring</label>
                                                                </div>
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="checkbox" id="rn-electrical">
                                                                    <label class="form-check-label" for="rn-electrical">Electrical Systems</label>
                                                                </div>
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="checkbox" id="rn-plumbing">
                                                                    <label class="form-check-label" for="rn-plumbing">Plumbing</label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <button type="button" class="btn btn-primary" id="rn-calculate">Calculate Estimate</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Results Section -->
                                        <div id="estimate-content" class="calculator-container p-4 p-md-5">

                                            <h2 class="text-center mb-4 fw-bold section-title">Cost Estimate</h2>
                                            <div id="initial-message" class="text-center py-4">
                                                <p class="text-muted">Select a project type and calculate to see your estimate</p>
                                            </div>
                                            <div id="results" class="hidden">
                                                <div class="cost-summary p-4 mb-4">
                                                    <h4 class="text-center">Total Estimated Cost</h4>
                                                    <h2 class="text-center mb-3" id="total-cost">₹0</h2>
                                                    <p class="text-center text-muted">Cost per sq ft: <span id="cost-per-sqft">₹0</span></p>
                                                </div>

                                                <h5 class="mb-3">Cost Breakdown</h5>
                                                <div class="table-responsive">
                                                    <table class="table table-bordered">
                                                        <tbody>
                                                            <tr>
                                                                <td>Base Construction:</td>
                                                                <td class="text-end" id="base-cost">₹0</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Quality Factor:</td>
                                                                <td class="text-end" id="quality-cost">₹0</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Additional Features:</td>
                                                                <td class="text-end" id="features-cost">₹0</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Location Factor:</td>
                                                                <td class="text-end" id="location-cost">₹0</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Taxes & Fees (10%):</td>
                                                                <td class="text-end" id="taxes-cost">₹0</td>
                                                            </tr>
                                                            <tr class="table-primary">
                                                                <td><strong>Total Cost:</strong></td>
                                                                <td class="text-end"><strong id="final-total-cost">₹0</strong></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                                                    <button class="btn btn-outline-secondary me-md-2" id="print-btn">
                                                        <i class="bi bi-printer me-1"></i>Print Estimate
                                                    </button>
                                                    <button class="btn btn-primary" id="save-btn">
                                                        <i class="bi bi-save me-1"></i>Save Estimate
                                                    </button>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </section>


        </section>

        <style>
            .btn-group.active {
                color: var(--primary-color) !important;
            }


            .calculator-tabs {
            }

            .cost-summary {
                border-left: 4px solid var(--primary-color);
            }

            #total-cost {
                color: var(--primary-color);
            }

            .hidden {
                display: none;
            }
        </style>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
            <script>
                $(document).ready(function () {

                    $('.tab-btn').on('click', function () {
                        var target = $(this).data('tab').toLowerCase();

                        // Update button active state
                        $('.tab-btn').removeClass('btn-primary').addClass('btn-outline-primary');
                        $(this).removeClass('btn-outline-primary').addClass('btn-primary');

                        // Hide all tab panes
                        $('.tab-pane').removeClass('show active');

                        // Show target tab pane
                        $('#' + target).addClass('show active');
                    });


                    // Residential calculation
                    $('#r-calculate').click(function () {
                        calculateResidential();
                    });

                    // Commercial calculation
                    $('#c-calculate').click(function () {
                        calculateCommercial();
                    });

                    // Renovation calculation
                    $('#rn-calculate').click(function () {
                        calculateRenovation();
                    });

                    // Print button
                    $('#print-btn').click(function () {
                        window.print();
                    });

                    $('#save-btn').click(async function () {
                        const { jsPDF } = window.jspdf;
                        const element = document.getElementById('estimate-content');

                        // Show loading alert
                        const originalText = $('#save-btn').html();
                        $('#save-btn').prop('disabled', true).html('<i class="bi bi-hourglass-split"></i> Saving...');

                        try {
                            // Convert HTML to canvas
                            const canvas = await html2canvas(element, { scale: 2 });
                            const imgData = canvas.toDataURL('image/png');
                            const pdf = new jsPDF('p', 'mm', 'a4');

                            const pdfWidth = pdf.internal.pageSize.getWidth();
                            const pdfHeight = (canvas.height * pdfWidth) / canvas.width;

                            pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);

                            // Prompt user to choose filename and save
                            pdf.save('Estimate_Report.pdf');

                        } catch (error) {
                            console.error("PDF generation failed:", error);
                            alert("Something went wrong while generating the PDF!");
                        } finally {
                            $('#save-btn').prop('disabled', false).html(originalText);
                        }
                    });

                    function calculateResidential() {
                        const area = parseInt($('#r-area').val());
                        const qualityRate = parseInt($('#r-quality').val());
                        const bedrooms = parseInt($('#r-bedrooms').val());
                        const bathrooms = parseInt($('#r-bathrooms').val());
                        const locationFactor = parseFloat($('#r-location').val());

                        // Calculate base cost
                        let baseCost = area * qualityRate;

                        // Adjust for bedrooms and bathrooms
                        let roomCost = (bedrooms * 50000) + (bathrooms * 75000);

                        // Additional features
                        let featuresCost = 0;
                        if ($('#r-garage').is(':checked')) featuresCost += 100000;
                        if ($('#r-garden').is(':checked')) featuresCost += 75000;
                        if ($('#r-pool').is(':checked')) featuresCost += 250000;

                        // Apply location factor
                        let subtotal = (baseCost + roomCost + featuresCost) * locationFactor;

                        // Calculate taxes (10%)
                        let taxes = subtotal * 0.1;

                        // Final total
                        let total = subtotal + taxes;

                        // Update UI
                        updateResults(baseCost, roomCost + featuresCost, locationFactor, taxes, total, area);
                    }

                    function calculateCommercial() {
                        const area = parseInt($('#c-area').val());
                        const qualityRate = parseInt($('#c-quality').val());
                        const floors = parseInt($('#c-floors').val());
                        const offices = parseInt($('#c-offices').val());
                        const locationFactor = parseFloat($('#c-location').val());

                        // Calculate base cost
                        let baseCost = area * qualityRate;

                        // Adjust for floors and offices
                        let structureCost = (floors * 150000) + (offices * 80000);

                        // Additional features
                        let featuresCost = 0;
                        if ($('#c-elevator').is(':checked')) featuresCost += 350000;
                        if ($('#c-parking').is(':checked')) featuresCost += 200000;
                        if ($('#c-ac').is(':checked')) featuresCost += 300000;

                        // Apply location factor
                        let subtotal = (baseCost + structureCost + featuresCost) * locationFactor;

                        // Calculate taxes (10%)
                        let taxes = subtotal * 0.1;

                        // Final total
                        let total = subtotal + taxes;

                        // Update UI
                        updateResults(baseCost, structureCost + featuresCost, locationFactor, taxes, total, area);
                    }

                    function calculateRenovation() {
                        const area = parseInt($('#rn-area').val());
                        const qualityRate = parseInt($('#rn-quality').val());
                        const age = parseInt($('#rn-age').val());
                        const conditionFactor = parseFloat($('#rn-condition').val());

                        // Calculate base cost
                        let baseCost = area * qualityRate;

                        // Age adjustment (older buildings cost more to renovate)
                        let ageAdjustment = 1;
                        if (age > 20) ageAdjustment = 1.2;
                        else if (age > 50) ageAdjustment = 1.5;

                        // Condition factor
                        baseCost = baseCost * conditionFactor * ageAdjustment;

                        // Additional features
                        let featuresCost = 0;
                        if ($('#rn-kitchen').is(':checked')) featuresCost += 80000;
                        if ($('#rn-bathroom').is(':checked')) featuresCost += 50000;
                        if ($('#rn-flooring').is(':checked')) featuresCost += 60000;
                        if ($('#rn-electrical').is(':checked')) featuresCost += 70000;
                        if ($('#rn-plumbing').is(':checked')) featuresCost += 65000;

                        // No location factor for renovation, using 1.0
                        let subtotal = baseCost + featuresCost;

                        // Calculate taxes (10%)
                        let taxes = subtotal * 0.1;

                        // Final total
                        let total = subtotal + taxes;

                        // Update UI
                        updateResults(baseCost, featuresCost, 1.0, taxes, total, area);
                    }

                    function updateResults(baseCost, featuresCost, locationFactor, taxes, total, area) {
                        $('#base-cost').text('₹' + Math.round(baseCost).toLocaleString('en-IN'));
                        $('#features-cost').text('₹' + Math.round(featuresCost).toLocaleString('en-IN'));
                        $('#location-cost').text((locationFactor > 1 ? '+' : '') + Math.round((locationFactor - 1) * 100) + '%');
                        $('#taxes-cost').text('₹' + Math.round(taxes).toLocaleString('en-IN'));
                        $('#total-cost').text('₹' + Math.round(total).toLocaleString('en-IN'));
                        $('#final-total-cost').text('₹' + Math.round(total).toLocaleString('en-IN'));

                        // Calculate cost per sq ft
                        const costPerSqft = total / area;
                        $('#cost-per-sqft').text('₹' + Math.round(costPerSqft).toLocaleString('en-IN'));

                        // Show results
                        $('#initial-message').addClass('hidden');
                        $('#results').removeClass('hidden');
                    }
                });
            </script>
    
    </main >


</asp:Content>
