<%@ Page Title="Material Calculator" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Material_Calculator.aspx.cs" Inherits="CMC.Pages.Tool.Material_Calculator" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <main class="content">

    <section>

        <!-- Page Hero Section -->
        <section class="page-hero">
            <div class="container">
                <h1 class="display-4 fw-bold ">Construction Material Calculator</h1>
                <p class="lead">Estimate the materials needed for your project</p>
            </div>
        </section>


        <section class="py-5 filter-row-button-section ">
            <div class="container">
                 <div class="tool-nav mb-3 d-flex gap-3">
                    <a href="/Pages/Tool/Material_Calculator" class="active btn btn-outline-primary"><i class="fas fa-calculator"></i>Material Calculator</a>
                    <a href="/Pages/Tool/Roof_Calculator" class="btn btn-outline-secondary"><i class="fas fa-home"></i>Roof Calculator</a>
                    <a href="/Pages/Tool/Floor_Planner" class="btn btn-outline-secondary"><i class="fas fa-ruler-combined"></i>Floor Planner</a>
                    <a href="/Pages/Tool/Unit_Convertor" class="btn btn-outline-secondary"><i class="fas fa-exchange-alt"></i>Unit Converter</a>
                </div>
            </div>
        </section>

        <section class="tool-container py-4">
            <div class="container">

                <!-- Calculator Tabs -->
                <div class="calculator-tabs btn-group mb-4" role="group" aria-label="Calculator tabs">
                    <button type="button" class="tab-btn btn btn-primary active" data-tab="brick">Brick Wall</button>
                    <button type="button" class="tab-btn btn btn-outline-primary" data-tab="concrete">Concrete</button>
                    <button type="button" class="tab-btn btn btn-outline-primary" data-tab="plaster">Plaster</button>
                    <button type="button" class="tab-btn btn btn-outline-primary" data-tab="paint">Paint</button>
                </div>

                <!-- Calculator Content -->
                <div class="calculator-content">

                    <!-- Brick Calculator -->
                    <div class="tab-pane active" id="brick">
                        <h3>Brick Wall Calculator</h3>
                        <div id="brickCalculator" class="mb-4">
                            <div class="mb-3">
                                <label for="wallLength" class="form-label">Wall Length (meters):</label>
                                <input type="number" id="wallLength" step="0.1" min="0.1" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="wallHeight" class="form-label">Wall Height (meters):</label>
                                <input type="number" id="wallHeight" step="0.1" min="0.1" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="wallThickness" class="form-label">Wall Thickness:</label>
                                <select id="wallThickness" class="form-select">
                                    <option value="0.1">Single brick (10cm)</option>
                                    <option value="0.2">Double brick (20cm)</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="brickType" class="form-label">Brick Type:</label>
                                <select id="brickType" class="form-select">
                                    <option value="standard">Standard (230×110×75mm)</option>
                                    <option value="modular">Modular (190×90×90mm)</option>
                                    <option value="custom">Custom Size</option>
                                </select>
                            </div>
                            <div class="mb-3 custom-size d-none" id="customSizeGroup">
                                <label for="customBrickSize" class="form-label">Custom Brick Size (mm):</label>
                                <input type="text" id="customBrickSize" class="form-control" placeholder="Length×Width×Height">
                            </div>
                            <div class="mb-3">
                                <label for="wastage" class="form-label">Wastage Percentage:</label>
                                <input type="number" id="wastage" value="5" min="0" max="20" step="1" class="form-control">%
                            </div>
                            <button id="btnbrickCalculator" class="btn btn-primary">Calculate</button>
                        </div>

                        <div class="results d-none" id="brickResults">
                            <h4>Material Estimation</h4>
                            <div class="row text-center mb-3">
                                <div class="col-md-4 mb-2">
                                    <div class="border p-3 rounded">
                                        <div class="h3" id="totalBricks">0</div>
                                        <div>Bricks Needed</div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-2">
                                    <div class="border p-3 rounded">
                                        <div class="h3" id="cementBags">0</div>
                                        <div>Cement Bags (50kg)</div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-2">
                                    <div class="border p-3 rounded">
                                        <div class="h3" id="sandVolume">0</div>
                                        <div>Sand (cubic meters)</div>
                                    </div>
                                </div>
                            </div>
                            <div class="cost-estimate mb-3">
                                <h5>Approximate Material Cost:</h5>
                                <div class="h4" id="materialCost">₹0</div>
                                <small>Based on current local market rates</small>
                            </div>
                            <div class="tool-tips">
                                <h5><i class="fas fa-lightbulb"></i>Tips:</h5>
                                <ul>
                                    <li>Add 5-10% extra for breakage and cuts</li>
                                    <li>Standard brick size varies by region</li>
                                    <li>Double-check measurements before ordering</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Concrete Calculator -->
                    <div class="tab-pane d-none" id="concrete">
                        <h3>Concrete Calculator</h3>
                        <div id="concreteCalculator" class="mb-4">
                            <div class="mb-3">
                                <label for="concreteArea" class="form-label">Area to be Covered (square meters):</label>
                                <input type="number" id="concreteArea" step="0.1" min="0.1" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="concreteThickness" class="form-label">Thickness (cm):</label>
                                <input type="number" id="concreteThickness" value="10" step="1" min="4" max="30" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="concreteGrade" class="form-label">Concrete Grade:</label>
                                <select id="concreteGrade" class="form-select">
                                    <option value="M10">M10 (1:3:6)</option>
                                    <option value="M15" selected>M15 (1:2:4)</option>
                                    <option value="M20">M20 (1:1.5:3)</option>
                                    <option value="M25">M25 (1:1:2)</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="concreteWastage" class="form-label">Wastage Percentage:</label>
                                <input type="number" id="concreteWastage" value="5" min="0" max="20" step="1" class="form-control">%
                            </div>
                            <button id="btnconcreteCalculator" class="btn btn-primary">Calculate</button>
                        </div>

                        <div class="results d-none" id="concreteResults">
                            <h4>Material Estimation</h4>
                            <div class="row text-center mb-3">
                                <div class="col-md-3 mb-2">
                                    <div class="border p-3 rounded">
                                        <div class="h3" id="totalConcrete">0</div>
                                        <div>Concrete Needed (m³)</div>
                                    </div>
                                </div>
                                <div class="col-md-3 mb-2">
                                    <div class="border p-3 rounded">
                                        <div class="h3" id="cementBagsConcrete">0</div>
                                        <div>Cement Bags (50kg)</div>
                                    </div>
                                </div>
                                <div class="col-md-3 mb-2">
                                    <div class="border p-3 rounded">
                                        <div class="h3" id="sandConcrete">0</div>
                                        <div>Sand (cubic meters)</div>
                                    </div>
                                </div>
                                <div class="col-md-3 mb-2">
                                    <div class="border p-3 rounded">
                                        <div class="h3" id="aggregateConcrete">0</div>
                                        <div>Aggregate (cubic meters)</div>
                                    </div>
                                </div>
                            </div>
                            <div class="cost-estimate mb-3">
                                <h5>Approximate Material Cost:</h5>
                                <div class="h4" id="concreteCost">₹0</div>
                                <small>Based on current local market rates</small>
                            </div>
                            <div class="tool-tips">
                                <h5><i class="fas fa-lightbulb"></i>Tips:</h5>
                                <ul>
                                    <li>Standard slab thickness is 10-15cm for residential floors</li>
                                    <li>M15 grade is most common for general construction</li>
                                    <li>Always order slightly more than calculated to account for uneven surfaces</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Plaster Calculator -->
                    <div class="tab-pane d-none" id="plaster">
                        <h3>Plaster Calculator</h3>
                        <div id="plasterCalculator" class="mb-4">
                            <div class="mb-3">
                                <label for="plasterArea" class="form-label">Wall Area (square meters):</label>
                                <input type="number" id="plasterArea" step="0.1" min="0.1" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="plasterThickness" class="form-label">Plaster Thickness (mm):</label>
                                <input type="number" id="plasterThickness" value="12" step="1" min="6" max="25" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="plasterType" class="form-label">Plaster Type:</label>
                                <select id="plasterType" class="form-select">
                                    <option value="cement">Cement Plaster (1:4)</option>
                                    <option value="cementLime">Cement-Lime Plaster (1:1:6)</option>
                                    <option value="gypsum">Gypsum Plaster</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="plasterWastage" class="form-label">Wastage Percentage:</label>
                                <input type="number" id="plasterWastage" value="10" min="0" max="20" step="1" class="form-control">%
                            </div>
                            <button id="btnplasterCalculator" class="btn btn-primary">Calculate</button>
                        </div>

                        <div class="results d-none" id="plasterResults">
                            <h4>Material Estimation</h4>
                            <div class="row text-center mb-3">
                                <div class="col-md-3 mb-2">
                                    <div class="border p-3 rounded">
                                        <div class="h3" id="totalPlaster">0</div>
                                        <div>Plaster Volume (m³)</div>
                                    </div>
                                </div>
                                <div class="col-md-3 mb-2">
                                    <div class="border p-3 rounded">
                                        <div class="h3" id="cementBagsPlaster">0</div>
                                        <div>Cement Bags (50kg)</div>
                                    </div>
                                </div>
                                <div class="col-md-3 mb-2">
                                    <div class="border p-3 rounded">
                                        <div class="h3" id="sandPlaster">0</div>
                                        <div>Sand (cubic meters)</div>
                                    </div>
                                </div>
                                <div class="col-md-3 mb-2 d-none" id="limeContainer">
                                    <div class="border p-3 rounded">
                                        <div class="h3" id="limePlaster">0</div>
                                        <div>Lime (kg)</div>
                                    </div>
                                </div>
                            </div>
                            <div class="cost-estimate mb-3">
                                <h5>Approximate Material Cost:</h5>
                                <div class="h4" id="plasterCost">₹0</div>
                                <small>Based on current local market rates</small>
                            </div>
                            <div class="tool-tips">
                                <h5><i class="fas fa-lightbulb"></i>Tips:</h5>
                                <ul>
                                    <li>Standard thickness is 12mm for walls and 6mm for ceilings</li>
                                    <li>For rough surfaces, add 20% extra to your calculations</li>
                                    <li>Moisten the wall before applying plaster for better adhesion</li>
                                    <li>Cement plaster requires curing for 7 days</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Paint Calculator -->
                    <div class="tab-pane d-none" id="paint">
                        <h3>Paint Calculator</h3>
                        <div id="paintCalculator" class="mb-4">
                            <div class="mb-3">
                                <label for="paintArea" class="form-label">Surface Area (square meters):</label>
                                <input type="number" id="paintArea" step="0.1" min="0.1" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="paintType" class="form-label">Paint Type:</label>
                                <select id="paintType" class="form-select">
                                    <option value="emulsion">Emulsion Paint</option>
                                    <option value="enamel">Enamel Paint</option>
                                    <option value="distemper">Distemper</option>
                                    <option value="texture">Texture Paint</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="surfaceType" class="form-label">Surface Type:</label>
                                <select id="surfaceType" class="form-select">
                                    <option value="smooth">Smooth Surface</option>
                                    <option value="rough">Rough Surface</option>
                                    <option value="textured">Textured Surface</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="coats" class="form-label">Number of Coats:</label>
                                <select id="coats" class="form-select">
                                    <option value="1">1 Coat</option>
                                    <option value="2" selected>2 Coats</option>
                                    <option value="3">3 Coats</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="paintWastage" class="form-label">Wastage Percentage:</label>
                                <input type="number" id="paintWastage" value="10" min="0" max="30" step="1" class="form-control">%
                            </div>
                            <button id="btnpaintCalculator" class="btn btn-primary">Calculate</button>
                        </div>

                        <div class="results d-none" id="paintResults">
                            <h4>Paint Estimation</h4>
                            <div class="row text-center mb-3">
                                <div class="col-md-3 mb-2">
                                    <div class="border p-3 rounded">
                                        <div class="h3" id="totalPaint">0</div>
                                        <div>Paint Needed (liters)</div>
                                    </div>
                                </div>
                                <div class="col-md-3 mb-2">
                                    <div class="border p-3 rounded">
                                        <div class="h3" id="paintCans">0</div>
                                        <div>Paint Cans</div>
                                    </div>
                                </div>
                                <div class="col-md-3 mb-2">
                                    <div class="border p-3 rounded">
                                        <div class="h3" id="primerVolume">0</div>
                                        <div>Primer (liters)</div>
                                    </div>
                                </div>
                                <div class="col-md-3 mb-2">
                                    <div class="border p-3 rounded">
                                        <div class="h3" id="puttyVolume">0</div>
                                        <div>Putty (kg)</div>
                                    </div>
                                </div>
                            </div>
                            <div class="cost-estimate mb-3">
                                <h5>Approximate Material Cost:</h5>
                                <div class="h4" id="paintCost">₹0</div>
                                <small>Based on current local market rates</small>
                            </div>
                            <div class="tool-tips">
                                <h5><i class="fas fa-lightbulb"></i>Tips:</h5>
                                <ul>
                                    <li>1 liter of emulsion typically covers 10-12 m² per coat</li>
                                    <li>Always prepare the surface properly before painting</li>
                                    <li>Use primer for better adhesion and durability</li>
                                    <li>Consider weather conditions when planning exterior painting</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /calculator-content -->
            </div>
        </section>

        <section class="tool-info py-4">
            <div class="container">
                <h3>How to Use This Calculator</h3>
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <div class="p-3 border rounded text-center">
                            <div class="fs-1 text-primary mb-2"><i class="fas fa-ruler"></i></div>
                            <h4>Take Measurements</h4>
                            <p>Measure the length and height of your wall in meters using a tape measure.</p>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="p-3 border rounded text-center">
                            <div class="fs-1 text-primary mb-2"><i class="fas fa-edit"></i></div>
                            <h4>Enter Details</h4>
                            <p>Fill in the dimensions and select your brick type and wall thickness.</p>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="p-3 border rounded text-center">
                            <div class="fs-1 text-primary mb-2"><i class="fas fa-calculator"></i></div>
                            <h4>Get Results</h4>
                            <p>View the estimated quantities of bricks, cement, and sand needed.</p>
                        </div>
                    </div>
                </div>

                <div class="tool-note mt-4 p-3 border rounded">
                    <h4><i class="fas fa-exclamation-triangle text-warning"></i>Important Note</h4>
                    <p>This calculator provides estimates only. For precise requirements, consult with our construction experts. Material costs may vary based on market conditions and your specific location in the village.</p>
                </div>
            </div>
        </section>
    </section>


    <!-- jQuery and functional script -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script>
        $(function () {
            // Tab Functionality
            $('.tab-btn').on('click', function () {
                const tabId = $(this).data('tab');
                $('.tab-btn').removeClass('btn-primary active').addClass('btn-outline-primary');
                $(this).removeClass('btn-outline-primary').addClass('btn-primary active');

                $('.tab-pane').removeClass('active').addClass('d-none');
                $('#' + tabId).removeClass('d-none').addClass('active');
            });

            // Brick Calculator: show/hide custom size
            $('#brickType').on('change', function () {
                if (this.value === 'custom') {
                    $('#customSizeGroup').removeClass('d-none');
                } else {
                    $('#customSizeGroup').addClass('d-none');
                }
            });

            // Brick Calculator Calculation
            $('#btnbrickCalculator').on('click', function (e) {
                e.preventDefault();

                const length = parseFloat($('#wallLength').val());
                const height = parseFloat($('#wallHeight').val());
                const thickness = parseFloat($('#wallThickness').val());
                const brickType = $('#brickType').val();
                const wastage = parseFloat($('#wastage').val()) / 100;

                let brickLength, brickWidth, brickHeight;

                if (brickType === 'standard') {
                    brickLength = 0.23;
                    brickWidth = 0.11;
                    brickHeight = 0.075;
                } else if (brickType === 'modular') {
                    brickLength = 0.19;
                    brickWidth = 0.09;
                    brickHeight = 0.09;
                } else {
                    const customSize = $('#customBrickSize').val();
                    const sizes = customSize.split('×').map(Number);
                    if (sizes.length !== 3 || sizes.some(isNaN)) {
                        alert('Please enter valid custom brick size in format: Length×Width×Height');
                        return;
                    }
                    brickLength = sizes[0] / 1000;
                    brickWidth = sizes[1] / 1000;
                    brickHeight = sizes[2] / 1000;
                }

                const mortar = 0.01;

                const effectiveLength = brickLength + mortar;
                const effectiveHeight = brickHeight + mortar;

                const bricksPerRow = Math.ceil(length / effectiveLength);
                const rows = Math.ceil(height / effectiveHeight);
                const layers = Math.ceil(thickness / (brickWidth + mortar));

                let totalBricks = bricksPerRow * rows * layers;
                totalBricks = Math.ceil(totalBricks * (1 + wastage));

                const wallVolume = length * height * thickness;
                const brickVolume = brickLength * brickWidth * brickHeight;
                const totalBrickVolume = totalBricks * brickVolume;
                const mortarVolume = wallVolume - totalBrickVolume;

                const cementBags = Math.ceil(mortarVolume * 14);
                const sandVolume = (mortarVolume * 2).toFixed(2);

                const brickRate = 8;
                const cementRate = 400;
                const sandRate = 1200;

                const totalCost = (totalBricks * brickRate) + (cementBags * cementRate) + (sandVolume * sandRate);

                $('#totalBricks').text(totalBricks.toLocaleString());
                $('#cementBags').text(cementBags.toLocaleString());
                $('#sandVolume').text(sandVolume);
                $('#materialCost').text('₹' + totalCost.toLocaleString());

                $('#brickResults').removeClass('d-none');

                $('#brickResults')[0].scrollIntoView({ behavior: 'smooth', block: 'nearest' });
            });

            // Concrete Calculator
            $('#btnconcreteCalculator').on('click', function (e) {
                e.preventDefault();

                const area = parseFloat($('#concreteArea').val());
                const thickness = parseFloat($('#concreteThickness').val()) / 100;
                const grade = $('#concreteGrade').val();
                const wastage = parseFloat($('#concreteWastage').val()) / 100 + 1;

                const volume = area * thickness * wastage;

                let cement, sand, aggregate;
                switch (grade) {
                    case 'M10':
                        cement = volume * 4.5;
                        sand = volume * 0.45;
                        aggregate = volume * 0.9;
                        break;
                    case 'M15':
                        cement = volume * 6.3;
                        sand = volume * 0.42;
                        aggregate = volume * 0.84;
                        break;
                    case 'M20':
                        cement = volume * 7.8;
                        sand = volume * 0.39;
                        aggregate = volume * 0.78;
                        break;
                    case 'M25':
                        cement = volume * 11;
                        sand = volume * 0.44;
                        aggregate = volume * 0.88;
                        break;
                }

                $('#totalConcrete').text(volume.toFixed(2));
                $('#cementBagsConcrete').text(Math.ceil(cement));
                $('#sandConcrete').text(sand.toFixed(2));
                $('#aggregateConcrete').text(aggregate.toFixed(2));

                const cementCost = Math.ceil(cement) * 400;
                const sandCost = sand * 1800;
                const aggregateCost = aggregate * 2000;
                const totalCost = cementCost + sandCost + aggregateCost;

                $('#concreteCost').text('₹' + totalCost.toLocaleString());
                $('#concreteResults').removeClass('d-none');
            });

            // Plaster Calculator
            $('#btnplasterCalculator').on('click', function (e) {
                e.preventDefault();

                const area = parseFloat($('#plasterArea').val());
                const thickness = parseFloat($('#plasterThickness').val()) / 1000;
                const type = $('#plasterType').val();
                const wastage = parseFloat($('#plasterWastage').val()) / 100 + 1;

                const volume = area * thickness * wastage;

                let cement = 0, sand = 0, lime = 0;
                const $limeContainer = $('#limeContainer');

                switch (type) {
                    case 'cement':
                        cement = volume * 1.5;
                        sand = volume * 0.2;
                        $limeContainer.hide();
                        break;
                    case 'cementLime':
                        cement = volume * 1.2;
                        lime = volume * 100;
                        sand = volume * 0.2;
                        $limeContainer.show();
                        break;
                    case 'gypsum':
                        cement = 0;
                        sand = 0;
                        $limeContainer.hide();
                        break;
                }

                $('#totalPlaster').text(volume.toFixed(3));

                if (type === 'gypsum') {
                    $('#cementBagsPlaster').text('N/A');
                    $('#sandPlaster').text('N/A');
                    const gypsumBags = Math.ceil((area * 10 * (thickness * 1000 / 12)) / 25);
                    $('#cementBagsPlaster').text(gypsumBags);
                    $('#sandPlaster').text('0');
                    $('#cementBagsPlaster').parent().find('.result-label').text('Gypsum Bags (25kg)');
                } else {
                    $('#cementBagsPlaster').text(Math.ceil(cement));
                    $('#sandPlaster').text(sand.toFixed(2));
                    $('#limePlaster').text(Math.ceil(lime));
                    $('#cementBagsPlaster').parent().find('.result-label').text('Cement Bags (50kg)');
                }

                let totalCost;
                if (type === 'gypsum') {
                    totalCost = Math.ceil($('#cementBagsPlaster').text()) * 300;
                } else {
                    const cementCost = Math.ceil(cement) * 400;
                    const sandCost = sand * 1800;
                    const limeCost = lime * 5;
                    totalCost = cementCost + sandCost + (type === 'cementLime' ? limeCost : 0);
                }

                $('#plasterCost').text('₹' + totalCost.toLocaleString());
                $('#plasterResults').removeClass('d-none');
            });

            // Show/hide lime field on plaster type change
            $('#plasterType').on('change', function () {
                if ($(this).val() === 'cementLime') {
                    $('#limeContainer').show();
                } else {
                    $('#limeContainer').hide();
                }
            });

            // Paint Calculator
            $('#btnpaintCalculator').on('click', function (e) {
                e.preventDefault();

                const area = parseFloat($('#paintArea').val());
                const paintType = $('#paintType').val();
                const surfaceType = $('#surfaceType').val();
                const coats = parseInt($('#coats').val());
                const wastage = parseFloat($('#paintWastage').val()) / 100 + 1;

                let coverage;
                switch (paintType) {
                    case 'emulsion': coverage = 0.09; break;
                    case 'enamel': coverage = 0.14; break;
                    case 'distemper': coverage = 0.07; break;
                    case 'texture': coverage = 0.2; break;
                }

                let surfaceFactor = 1;
                if (surfaceType === 'rough') surfaceFactor = 1.3;
                if (surfaceType === 'textured') surfaceFactor = 1.5;

                const paintNeeded = area * coverage * coats * surfaceFactor * wastage;
                const primerNeeded = (paintType === 'emulsion' || paintType === 'enamel') ? Math.max(area * 0.1 * surfaceFactor * wastage, 1) : 0;
                const puttyNeeded = (paintType === 'emulsion' || paintType === 'enamel') ? Math.ceil(area * 0.2 * wastage) : 0;
                const paintCans = Math.ceil(paintNeeded / 4);

                $('#totalPaint').text(paintNeeded.toFixed(1));
                $('#paintCans').text(paintCans);
                $('#primerVolume').text(primerNeeded.toFixed(1));
                $('#puttyVolume').text(puttyNeeded);

                let paintRate, primerRate = 120, puttyRate = 40;
                switch (paintType) {
                    case 'emulsion': paintRate = 200; break;
                    case 'enamel': paintRate = 300; break;
                    case 'distemper': paintRate = 80; break;
                    case 'texture': paintRate = 150; break;
                }

                const totalCost = (paintNeeded * paintRate) + (primerNeeded * primerRate) + (puttyNeeded * puttyRate);
                $('#paintCost').text('₹' + Math.round(totalCost).toLocaleString());
                $('#paintResults').removeClass('d-none');
            });

            // Initialize first tab
            $('.tab-btn.active').trigger('click');
        });
    </script>
</main>


</asp:Content>
