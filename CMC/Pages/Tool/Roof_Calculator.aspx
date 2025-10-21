
<%@ Page Title="Roof Calculator" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Roof_Calculator.aspx.cs" Inherits="CMC.Pages.Tool.Roof_Calculator" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <main class="content">

    <style>
        :root {
            --primary: #2c3e50;
            --secondary: #e74c3c;
            --accent: #3498db;
            --light: #ecf0f1;
            --dark: #2c3e50;
            --success: #27ae60;
        }
        
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .navbar {
            background-color: var(--primary);
        }
        
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            margin-bottom: 20px;
            border: none;
            overflow: hidden;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.15);
        }
        
        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
        }
        
        .btn-primary:hover {
            background-color: var(--secondary);
            border-color: var(--secondary);
        }
        
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('https://images.unsplash.com/photo-1591955506264-3f5a6834570a?ixlib=rb-4.0.3&auto=format&fit=crop&w=1500&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 100px 0;
            margin-bottom: 40px;
            text-align: center;
        }
        
        .footer {
            background-color: var(--dark);
            color: white;
            padding: 30px 0;
            margin-top: 40px;
        }
        
        .calculator-container {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
        }
        
        .form-section {
            padding: 20px;
            border-radius: 8px;
            background-color: #f8f9fa;
            margin-bottom: 20px;
        }
        
        .results-section {
            padding: 20px;
            border-radius: 8px;
            background-color: #e8f4f8;
            margin-top: 20px;
        }
        
        .roof-visualization {
            height: 200px;
            background: #e8f4f8;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            position: relative;
            overflow: hidden;
        }
        
        .material-card {
            transition: all 0.3s ease;
            cursor: pointer;
        }
        
        .material-card:hover {
            transform: scale(1.03);
        }
        
        .material-card.selected {
            border: 2px solid var(--success);
            background-color: #f0fff4;
        }
        
        .material-image {
            height: 120px;
            object-fit: cover;
        }
        
        .cost-breakdown {
            border-left: 4px solid var(--primary);
            padding-left: 15px;
        }
        
        .progress {
            height: 25px;
            border-radius: 5px;
        }
        
        .roof-type-icon {
            font-size: 24px;
            margin-right: 10px;
            color: var(--primary);
        }
        
        .input-group-text {
            background-color: var(--light);
        }
        
        @media (max-width: 768px) {
            .hero-section {
                padding: 60px 0;
            }
            
            .roof-visualization {
                height: 150px;
            }
        }
        
        .roof-diagram {
            width: 100%;
            height: 100%;
            position: relative;
        }
        
        .triangle {
            width: 0;
            height: 0;
            border-left: 100px solid transparent;
            border-right: 100px solid transparent;
            border-bottom: 70px solid #a67c52;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        
        .rectangle {
            width: 200px;
            height: 30px;
            background: #a67c52;
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
        }
        
        .calculation-step {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            padding: 10px;
            background: white;
            border-radius: 8px;
        }
        
        .step-number {
            width: 30px;
            height: 30px;
            background: var(--primary);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            flex-shrink: 0;
        }
    </style>
 
    

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="container">
            <h1 class="display-4 fw-bold">Roof Calculator</h1>
            <p class="lead">Calculate materials, costs, and requirements for your roofing project</p>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="calculator-container">
                    <h3 class="mb-4"><i class="fas fa-ruler-combined me-2"></i>Roof Dimensions</h3>
                    
                    <div class="form-section">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="roof-type" class="form-label">Roof Type</label>
                                <select class="form-select" id="roof-type">
                                    <option value="gable">Gable Roof</option>
                                    <option value="hip">Hip Roof</option>
                                    <option value="flat">Flat Roof</option>
                                    <option value="shed">Shed Roof</option>
                                    <option value="mansard">Mansard Roof</option>
                                </select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="roof-material" class="form-label">Roofing Material</label>
                                <select class="form-select" id="roof-material">
                                    <option value="asphalt">Asphalt Shingles</option>
                                    <option value="metal">Metal Roofing</option>
                                    <option value="tile">Clay Tiles</option>
                                    <option value="slate">Slate</option>
                                    <option value="wood">Wood Shakes</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="length" class="form-label">Length (feet)</label>
                                <input type="number" class="form-control" id="length" placeholder="e.g., 40" value="40">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="width" class="form-label">Width (feet)</label>
                                <input type="number" class="form-control" id="width" placeholder="e.g., 30" value="30">
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="pitch" class="form-label">Roof Pitch (rise/12)</label>
                                <input type="number" class="form-control" id="pitch" placeholder="e.g., 6" value="6">
                                <div class="form-text">Common pitches: 4/12 (low), 6/12 (medium), 12/12 (steep)</div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="overhang" class="form-label">Overhang (inches)</label>
                                <input type="number" class="form-control" id="overhang" placeholder="e.g., 12" value="12">
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="waste" class="form-label">Waste Factor (%)</label>
                                <input type="number" class="form-control" id="waste" placeholder="e.g., 10" value="10">
                                <div class="form-text">Typically 10-15% for cut waste</div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="complexity" class="form-label">Roof Complexity</label>
                                <select class="form-select" id="complexity">
                                    <option value="simple">Simple (few cuts)</option>
                                    <option value="medium" selected>Medium (some valleys)</option>
                                    <option value="complex">Complex (many features)</option>
                                </select>
                            </div>
                        </div>
                        
                        <button class="btn btn-primary w-100" id="calculate-btn">
                            <i class="fas fa-calculator me-2"></i>Calculate Roof Requirements
                        </button>
                    </div>
                    
                    <div class="roof-visualization">
                        <div class="roof-diagram">
                            <div class="triangle"></div>
                            <div class="rectangle"></div>
                        </div>
                    </div>
                    
                    <div class="results-section d-none" id="results-section">
                        <h3 class="mb-4"><i class="fas fa-chart-pie me-2"></i>Calculation Results</h3>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="calculation-step">
                                    <div class="step-number">1</div>
                                    <div>
                                        <h6 class="mb-0">Roof Area</h6>
                                        <p class="mb-0" id="roof-area">0 sq ft</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="calculation-step">
                                    <div class="step-number">2</div>
                                    <div>
                                        <h6 class="mb-0">Surface Area</h6>
                                        <p class="mb-0" id="surface-area">0 sq ft</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <div class="calculation-step">
                                    <div class="step-number">3</div>
                                    <div>
                                        <h6 class="mb-0">Material Needed</h6>
                                        <p class="mb-0" id="material-needed">0 sq ft</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="calculation-step">
                                    <div class="step-number">4</div>
                                    <div>
                                        <h6 class="mb-0">Bundles/Squares</h6>
                                        <p class="mb-0" id="bundles">0</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <h5 class="mt-4">Materials Estimate</h5>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead class="table-light">
                                    <tr>
                                        <th>Material</th>
                                        <th>Quantity</th>
                                        <th>Unit</th>
                                    </tr>
                                </thead>
                                <tbody id="materials-table">
                                    <!-- Materials will be populated here -->
                                </tbody>
                            </table>
                        </div>
                        
                        <h5 class="mt-4">Cost Estimate</h5>
                        <div class="cost-breakdown">
                            <div class="d-flex justify-content-between mb-2">
                                <span>Materials Cost:</span>
                                <span id="materials-cost">₹0</span>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span>Underlayment:</span>
                                <span id="underlayment-cost">₹0</span>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span>Flashing & Accessories:</span>
                                <span id="accessories-cost">₹0</span>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span>Labor (estimated):</span>
                                <span id="labor-cost">₹0</span>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between fw-bold">
                                <span>Total Estimated Cost:</span>
                                <span id="total-cost">₹0</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5 class="card-title mb-0"><i class="fas fa-info-circle me-2"></i>Roofing Information</h5>
                    </div>
                    <div class="card-body">
                        <h6>Roof Pitch Guide</h6>
                        <div class="mb-3">
                            <div class="d-flex justify-content-between">
                                <span>Low Slope (2/12 - 4/12)</span>
                                <span>9.5° - 18.4°</span>
                            </div>
                            <div class="progress mb-2">
                                <div class="progress-bar" role="progressbar" style="width: 25%"></div>
                            </div>
                            
                            <div class="d-flex justify-content-between">
                                <span>Medium (4/12 - 9/12)</span>
                                <span>18.4° - 36.9°</span>
                            </div>
                            <div class="progress mb-2">
                                <div class="progress-bar" role="progressbar" style="width: 50%"></div>
                            </div>
                            
                            <div class="d-flex justify-content-between">
                                <span>Steep (9/12 - 12/12)</span>
                                <span>36.9° - 45°</span>
                            </div>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width: 75%"></div>
                            </div>
                        </div>
                        
                        <h6 class="mt-4">Material Coverage</h6>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Asphalt Shingles
                                <span class="badge bg-primary rounded-pill">100 sq ft per square</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Metal Roofing
                                <span class="badge bg-primary rounded-pill">100 sq ft per square</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Clay Tiles
                                <span class="badge bg-primary rounded-pill">100 sq ft per square</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Slate
                                <span class="badge bg-primary rounded-pill">100 sq ft per square</span>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <div class="card mt-4">
                    <div class="card-header bg-success text-white">
                        <h5 class="card-title mb-0"><i class="fas fa-tools me-2"></i>Recommended Tools</h5>
                    </div>
                    <div class="card-body">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                <i class="fas fa-hammer me-2"></i>Roofing Hammer
                            </li>
                            <li class="list-group-item">
                                <i class="fas fa-tachometer-alt me-2"></i>Chalk Line
                            </li>
                            <li class="list-group-item">
                                <i class="fas fa-ruler me-2"></i>Measuring Tape
                            </li>
                            <li class="list-group-item">
                                <i class="fas fa-cut me-2"></i>Utility Knife
                            </li>
                            <li class="list-group-item">
                                <i class="fas fa-boot me-2"></i>Roofing Boots
                            </li>
                            <li class="list-group-item">
                                <i class="fas fa-vest me-2"></i>Safety Harness
                            </li>
                        </ul>
                    </div>
                </div>
                
                <div class="card mt-4">
                    <div class="card-header bg-warning">
                        <h5 class="card-title mb-0"><i class="fas fa-exclamation-triangle me-2"></i>Safety Tips</h5>
                    </div>
                    <div class="card-body">
                        <div class="alert alert-warning">
                            <i class="fas fa-cloud-rain me-2"></i> Avoid roofing work in wet or windy conditions
                        </div>
                        <div class="alert alert-info">
                            <i class="fas fa-helmet-safety me-2"></i> Always wear proper safety equipment
                        </div>
                        <div class="alert alert-danger">
                            <i class="fas fa-bolt me-2"></i> Be aware of overhead power lines
                        </div>
                        <div class="alert alert-success">
                            <i class="fas fa-sun me-2"></i> Work in cooler parts of the day during summer
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 

    <script>
        $(document).ready(function() {
            // Material data with prices (in ₹ for Indian market)
            const materialData = {
                asphalt: {
                    name: "Asphalt Shingles",
                    costPerSquare: 4500, // ₹ per square (100 sq ft)
                    underlayment: 800,   // ₹ per square
                    accessories: 600,    // ₹ per square
                    labor: 2500,         // ₹ per square
                    coverage: 100        // sq ft per square
                },
                metal: {
                    name: "Metal Roofing",
                    costPerSquare: 8500,
                    underlayment: 1000,
                    accessories: 1200,
                    labor: 3500,
                    coverage: 100
                },
                tile: {
                    name: "Clay Tiles",
                    costPerSquare: 12000,
                    underlayment: 800,
                    accessories: 1500,
                    labor: 4500,
                    coverage: 100
                },
                slate: {
                    name: "Slate",
                    costPerSquare: 18000,
                    underlayment: 1000,
                    accessories: 2000,
                    labor: 6000,
                    coverage: 100
                },
                wood: {
                    name: "Wood Shakes",
                    costPerSquare: 9500,
                    underlayment: 900,
                    accessories: 1100,
                    labor: 4000,
                    coverage: 100
                }
            };
            
            // Update roof visualization based on type
            $('#roof-type').on('change', updateRoofVisualization);
            
            // Calculate button event
            $('#calculate-btn').on('click', calculateRoof);
            
            // Initialize the roof visualization
            updateRoofVisualization();
            
            // Function to update roof visualization
            function updateRoofVisualization() {
                const roofType = $('#roof-type').val();
                const visualization = $('.roof-diagram');
                visualization.empty();
                
                switch(roofType) {
                    case 'gable':
                        visualization.append('<div class="triangle"></div><div class="rectangle"></div>');
                        break;
                    case 'hip':
                        visualization.append('<div class="triangle" style="border-bottom-color: #8c6239"></div><div class="rectangle" style="background: #8c6239; width: 150px;"></div>');
                        break;
                    case 'flat':
                        visualization.append('<div class="rectangle" style="height: 10px; width: 180px; background: #6d4c41;"></div>');
                        break;
                    case 'shed':
                        visualization.append('<div style="width: 200px; height: 70px; background: linear-gradient(to bottom, #a67c52, #8c6239); position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></div>');
                        break;
                    case 'mansard':
                        visualization.append('<div style="width: 0; height: 0; border-left: 80px solid transparent; border-right: 80px solid transparent; border-bottom: 50px solid #8c6239; position: absolute; top: 30%; left: 50%; transform: translateX(-50%)"></div><div style="width: 160px; height: 40px; background: #8c6239; position: absolute; top: 50%; left: 50%; transform: translateX(-50%)"></div>');
                        break;
                }
            }
            
            // Function to calculate roof requirements
            function calculateRoof() {
                // Get input values
                const length = parseFloat($('#length').val()) || 0;
                const width = parseFloat($('#width').val()) || 0;
                const pitch = parseFloat($('#pitch').val()) || 0;
                const overhang = parseFloat($('#overhang').val()) || 0;
                const wasteFactor = parseFloat($('#waste').val()) || 0;
                const materialType = $('#roof-material').val();
                const complexity = $('#complexity').val();
                
                // Validate inputs
                if (length <= 0 || width <= 0) {
                    alert('Please enter valid dimensions for length and width');
                    return;
                }
                
                // Calculate roof area (including overhang)
                const overhangFeet = overhang / 12;
                const effectiveLength = length + (2 * overhangFeet);
                const effectiveWidth = width + (2 * overhangFeet);
                const roofArea = effectiveLength * effectiveWidth;
                
                // Calculate pitch multiplier
                const pitchMultiplier = Math.sqrt(Math.pow(pitch, 2) + 144) / 12;
                
                // Calculate surface area (accounting for pitch)
                const surfaceArea = roofArea * pitchMultiplier;
                
                // Apply complexity factor
                let complexityFactor = 1;
                if (complexity === 'medium') complexityFactor = 1.1;
                if (complexity === 'complex') complexityFactor = 1.2;
                
                // Apply waste factor
                const wasteMultiplier = 1 + (wasteFactor / 100);
                
                // Calculate total material needed
                const materialNeeded = surfaceArea * complexityFactor * wasteMultiplier;
                
                // Calculate squares and bundles
                const squares = materialNeeded / 100;
                const bundles = squares * 3; // Typically 3 bundles per square
                
                // Get material info
                const material = materialData[materialType];
                
                // Calculate costs
                const materialsCost = squares * material.costPerSquare;
                const underlaymentCost = squares * material.underlayment;
                const accessoriesCost = squares * material.accessories;
                const laborCost = squares * material.labor;
                const totalCost = materialsCost + underlaymentCost + accessoriesCost + laborCost;
                
                // Format numbers with commas
                function formatNumber(num) {
                    return num.toLocaleString('en-IN');
                }
                
                // Update results
                $('#roof-area').text(formatNumber(roofArea.toFixed(2)) + ' sq ft');
                $('#surface-area').text(formatNumber(surfaceArea.toFixed(2)) + ' sq ft');
                $('#material-needed').text(formatNumber(materialNeeded.toFixed(2)) + ' sq ft');
                $('#bundles').text(formatNumber(Math.ceil(bundles)) + ' bundles (' + formatNumber(squares.toFixed(2)) + ' squares)');
                
                // Update materials table
                const materialsTable = `
                    <tr>
                        <td>${material.name}</td>
                        <td>${formatNumber(squares.toFixed(2))}</td>
                        <td>Squares</td>
                    </tr>
                    <tr>
                        <td>Underlayment</td>
                        <td>${formatNumber(squares.toFixed(2))}</td>
                        <td>Squares</td>
                    </tr>
                    <tr>
                        <td>Roofing Nails</td>
                        <td>${formatNumber(Math.ceil(squares * 1.5))}</td>
                        <td>Kg</td>
                    </tr>
                    <tr>
                        <td>Flashing</td>
                        <td>${formatNumber(Math.ceil(length / 10))}</td>
                        <td>Linear ft</td>
                    </tr>
                    <tr>
                        <td>Ridge Caps</td>
                        <td>${formatNumber(Math.ceil(length / 5))}</td>
                        <td>Pieces</td>
                    </tr>
                `;
                $('#materials-table').html(materialsTable);
                
                // Update costs
                $('#materials-cost').text('₹' + formatNumber(Math.round(materialsCost)));
                $('#underlayment-cost').text('₹' + formatNumber(Math.round(underlaymentCost)));
                $('#accessories-cost').text('₹' + formatNumber(Math.round(accessoriesCost)));
                $('#labor-cost').text('₹' + formatNumber(Math.round(laborCost)));
                $('#total-cost').text('₹' + formatNumber(Math.round(totalCost)));
                
                // Show results section
                $('#results-section').removeClass('d-none');
                
                // Scroll to results
                $('html, body').animate({
                    scrollTop: $('#results-section').offset().top - 100
                }, 1000);
            }
        });
    </script> 
</main>

</asp:Content>
