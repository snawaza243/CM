<%@ Page Title="Unit Convert" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Unit_Convertor.aspx.cs" Inherits="CMC.Pages.Tool.Unit_Convert" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <main class="content">

    <section>

        <section class="page-hero">
            <div class="container">
                <h1 class="display-4 fw-bold ">Construction Unit Converter</h1>
                <p class="lead">Convert between different measurement units used in construction</p>
            </div>
        </section>

        <section class="py-5 filter-row-button-section ">
            <div class="container">
                <div class="tool-nav mb-3 d-flex gap-3">
                    <a href="/Pages/Tool/Material_Calculator" class=" btn btn-outline-secondary"><i class="fas fa-calculator"></i>Material Calculator</a>
                    <a href="/Pages/Tool/Roof_Calculator" class="btn btn-outline-secondary"><i class="fas fa-home"></i>Roof Calculator</a>
                    <a href="/Pages/Tool/Floor_Planner" class="btn btn-outline-secondary"><i class="fas fa-ruler-combined"></i>Floor Planner</a>
                    <a href="/Pages/Tool/Unit_Convertor" class="btn btn-outline-primary active"><i class="fas fa-exchange-alt"></i>Unit Converter</a>
                </div>
            </div>

        </section>

        <section class="tool-container py-4">
            <div class="container">
                <div class="calculator-tabs btn-group mb-4" role="group" aria-label="Unit converter tabs">
                    <button type="button" class="tab-btn btn btn-primary active" data-tab="length">Length</button>
                    <button type="button" class="tab-btn btn btn-outline-primary" data-tab="area">Area</button>
                    <button type="button" class="tab-btn btn btn-outline-primary" data-tab="volume">Volume</button>
                    <button type="button" class="tab-btn btn btn-outline-primary" data-tab="weight">Weight</button>
                    <button type="button" class="tab-btn btn btn-outline-primary" data-tab="rate">Rate Calculator</button>
                    <button type="button" class="tab-btn btn btn-outline-primary" data-tab="scientific">Scientific Calculator</button>
                </div>

                <div class="calculator-content">

                    <!-- Length Converter -->
                    <div class="tab-pane active" id="length">
                        <h3>Length Unit Converter</h3>
                        <div id="lengthConverter" class="mb-4 row gx-3 gy-2 align-items-center">
                            <div class="col-auto">
                                <label for="lengthValue" class="form-label">Value:</label>
                                <input type="number" id="lengthValue" step="0.01" min="0" required class="form-control" />
                            </div>
                            <div class="col-auto">
                                <label for="lengthFrom" class="form-label">From:</label>
                                <select id="lengthFrom" class="form-select">
                                    <option value="mm">Millimeters (mm)</option>
                                    <option value="cm">Centimeters (cm)</option>
                                    <option value="m" selected>Meters (m)</option>
                                    <option value="in">Inches (in)</option>
                                    <option value="ft">Feet (ft)</option>
                                    <option value="yd">Yards (yd)</option>
                                </select>
                            </div>
                            <div class="col-auto">
                                <label for="lengthTo" class="form-label">To:</label>
                                <select id="lengthTo" class="form-select">
                                    <option value="mm">Millimeters (mm)</option>
                                    <option value="cm" selected>Centimeters (cm)</option>
                                    <option value="m">Meters (m)</option>
                                    <option value="in">Inches (in)</option>
                                    <option value="ft">Feet (ft)</option>
                                    <option value="yd">Yards (yd)</option>
                                </select>
                            </div>
                            <div class="col-auto align-self-end">
                                <button type="submit" class="btn btn-primary">Convert</button>
                            </div>
                        </div>

                        <div class="results d-none" id="lengthResults">
                            <h4>Conversion Result</h4>
                            <div class="result-grid">
                                <div class="result-card border p-3 rounded text-center">
                                    <div class="result-value fs-2" id="lengthResult">0</div>
                                    <div class="result-label fs-5" id="lengthResultLabel">cm</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Area Converter -->
                    <div class="tab-pane d-none" id="area">
                        <h3>Area Unit Converter</h3>
                        <div id="areaConverter" class="mb-4 row gx-3 gy-2 align-items-center">
                            <div class="col-auto">
                                <label for="areaValue" class="form-label">Value:</label>
                                <input type="number" id="areaValue" step="0.01" min="0" required class="form-control" />
                            </div>
                            <div class="col-auto">
                                <label for="areaFrom" class="form-label">From:</label>
                                <select id="areaFrom" class="form-select">
                                    <option value="mm2">Square Millimeters (mm²)</option>
                                    <option value="cm2">Square Centimeters (cm²)</option>
                                    <option value="m2" selected>Square Meters (m²)</option>
                                    <option value="ft2">Square Feet (ft²)</option>
                                    <option value="yd2">Square Yards (yd²)</option>
                                    <option value="acre">Acres</option>
                                    <option value="hectare">Hectares</option>
                                </select>
                            </div>
                            <div class="col-auto">
                                <label for="areaTo" class="form-label">To:</label>
                                <select id="areaTo" class="form-select">
                                    <option value="mm2">Square Millimeters (mm²)</option>
                                    <option value="cm2">Square Centimeters (cm²)</option>
                                    <option value="m2">Square Meters (m²)</option>
                                    <option value="ft2" selected>Square Feet (ft²)</option>
                                    <option value="yd2">Square Yards (yd²)</option>
                                    <option value="acre">Acres</option>
                                    <option value="hectare">Hectares</option>
                                </select>
                            </div>
                            <div class="col-auto align-self-end">
                                <button type="submit" class="btn btn-primary">Convert</button>
                            </div>
                        </div>
                        <div class="results d-none" id="areaResults">
                            <h4>Conversion Result</h4>
                            <div class="result-grid">
                                <div class="result-card border p-3 rounded text-center">
                                    <div class="result-value fs-2" id="areaResult">0</div>
                                    <div class="result-label fs-5" id="areaResultLabel">ft²</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Volume Converter -->
                    <div class="tab-pane d-none" id="volume">
                        <h3>Volume Unit Converter</h3>
                        <div id="volumeConverter" class="mb-4 row gx-3 gy-2 align-items-center">
                            <div class="col-auto">
                                <label for="volumeValue" class="form-label">Value:</label>
                                <input type="number" id="volumeValue" step="0.01" min="0" required class="form-control" />
                            </div>
                            <div class="col-auto">
                                <label for="volumeFrom" class="form-label">From:</label>
                                <select id="volumeFrom" class="form-select">
                                    <option value="mm3">Cubic Millimeters (mm³)</option>
                                    <option value="cm3">Cubic Centimeters (cm³)</option>
                                    <option value="m3" selected>Cubic Meters (m³)</option>
                                    <option value="in3">Cubic Inches (in³)</option>
                                    <option value="ft3">Cubic Feet (ft³)</option>
                                    <option value="yd3">Cubic Yards (yd³)</option>
                                    <option value="liter">Liters (l)</option>
                                    <option value="gallon">Gallons (gal)</option>
                                </select>
                            </div>
                            <div class="col-auto">
                                <label for="volumeTo" class="form-label">To:</label>
                                <select id="volumeTo" class="form-select">
                                    <option value="mm3">Cubic Millimeters (mm³)</option>
                                    <option value="cm3">Cubic Centimeters (cm³)</option>
                                    <option value="m3">Cubic Meters (m³)</option>
                                    <option value="in3">Cubic Inches (in³)</option>
                                    <option value="ft3" selected>Cubic Feet (ft³)</option>
                                    <option value="yd3">Cubic Yards (yd³)</option>
                                    <option value="liter">Liters (l)</option>
                                    <option value="gallon">Gallons (gal)</option>
                                </select>
                            </div>
                            <div class="col-auto align-self-end">
                                <button type="submit" class="btn btn-primary">Convert</button>
                            </div>
                        </div>
                        <div class="results d-none" id="volumeResults">
                            <h4>Conversion Result</h4>
                            <div class="result-grid">
                                <div class="result-card border p-3 rounded text-center">
                                    <div class="result-value fs-2" id="volumeResult">0</div>
                                    <div class="result-label fs-5" id="volumeResultLabel">ft³</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Weight Converter -->
                    <div class="tab-pane d-none" id="weight">
                        <h3>Weight Unit Converter</h3>
                        <div id="weightConverter" class="mb-4 row gx-3 gy-2 align-items-center">
                            <div class="col-auto">
                                <label for="weightValue" class="form-label">Value:</label>
                                <input type="number" id="weightValue" step="0.01" min="0" required class="form-control" />
                            </div>
                            <div class="col-auto">
                                <label for="weightFrom" class="form-label">From:</label>
                                <select id="weightFrom" class="form-select">
                                    <option value="mg">Milligrams (mg)</option>
                                    <option value="g">Grams (g)</option>
                                    <option value="kg" selected>Kilograms (kg)</option>
                                    <option value="ton">Metric Tons (t)</option>
                                    <option value="oz">Ounces (oz)</option>
                                    <option value="lb">Pounds (lb)</option>
                                </select>
                            </div>
                            <div class="col-auto">
                                <label for="weightTo" class="form-label">To:</label>
                                <select id="weightTo" class="form-select">
                                    <option value="mg">Milligrams (mg)</option>
                                    <option value="g">Grams (g)</option>
                                    <option value="kg">Kilograms (kg)</option>
                                    <option value="ton">Metric Tons (t)</option>
                                    <option value="oz" selected>Ounces (oz)</option>
                                    <option value="lb">Pounds (lb)</option>
                                </select>
                            </div>
                            <div class="col-auto align-self-end">
                                <button type="submit" class="btn btn-primary">Convert</button>
                            </div>
                        </div>
                        <div class="results d-none" id="weightResults">
                            <h4>Conversion Result</h4>
                            <div class="result-grid">
                                <div class="result-card border p-3 rounded text-center">
                                    <div class="result-value fs-2" id="weightResult">0</div>
                                    <div class="result-label fs-5" id="weightResultLabel">oz</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Rate Calculator -->
                    <div class="tab-pane d-none" id="rate">
                        <h3>Construction Rate Calculator</h3>
                        <div id="rateCalculator" class="mb-4 row gx-3 gy-2 align-items-center">
                            <div class="col-auto">
                                <label for="rateValue" class="form-label">Value:</label>
                                <input type="number" id="rateValue" step="0.01" min="0" required class="form-control" />
                            </div>
                            <div class="col-auto">
                                <label for="rateFrom" class="form-label">From:</label>
                                <select id="rateFrom" class="form-select">
                                    <option value="sqft">Per Square Foot</option>
                                    <option value="sqm" selected>Per Square Meter</option>
                                    <option value="sqyd">Per Square Yard</option>
                                    <option value="cft">Per Cubic Foot</option>
                                    <option value="cum">Per Cubic Meter</option>
                                    <option value="kg">Per Kilogram</option>
                                    <option value="ton">Per Metric Ton</option>
                                    <option value="piece">Per Piece</option>
                                </select>
                            </div>
                            <div class="col-auto">
                                <label for="rateTo" class="form-label">To:</label>
                                <select id="rateTo" class="form-select">
                                    <option value="sqft" selected>Per Square Foot</option>
                                    <option value="sqm">Per Square Meter</option>
                                    <option value="sqyd">Per Square Yard</option>
                                    <option value="cft">Per Cubic Foot</option>
                                    <option value="cum">Per Cubic Meter</option>
                                    <option value="kg">Per Kilogram</option>
                                    <option value="ton">Per Metric Ton</option>
                                    <option value="piece">Per Piece</option>
                                </select>
                            </div>
                            <div class="col-auto">
                                <label for="quantity" class="form-label">Quantity (optional for piece rate):</label>
                                <input type="number" id="quantity" step="0.01" min="0" class="form-control" />
                            </div>
                            <div class="col-auto align-self-end">
                                <button type="submit" class="btn btn-primary">Calculate</button>
                            </div>
                        </div>

                        <div class="results d-none" id="rateResults">
                            <h4>Calculation Result</h4>
                            <div class="result-grid d-flex gap-3 flex-wrap">
                                <div class="result-card border p-3 rounded text-center flex-grow-1" style="min-width: 180px;">
                                    <div class="result-value fs-2" id="rateResult">0</div>
                                    <div class="result-label fs-5" id="rateResultLabel">per sq.ft</div>
                                </div>
                                <div class="result-card border p-3 rounded text-center flex-grow-1 d-none" id="totalCostContainer" style="min-width: 180px;">
                                    <div class="result-value fs-2" id="totalCost">0</div>
                                    <div class="result-label fs-5">Total Cost</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Scientific Calculator -->
                    <div class="tab-pane d-none" id="scientific">
                        <h3>Scientific Calculator</h3>
                        <div class="scientific-calculator border p-3 rounded bg-white">
                            <div class="calculator-display mb-3">
                                <div class="previous-operand text-muted" id="previousOperand"></div>
                                <div class="current-operand fs-3 fw-bold" id="currentOperand">0</div>
                            </div>
                            <div class="calculator-buttons d-grid gap-2" style="grid-template-columns: repeat(4, 1fr);">
                                <button class="btn btn-secondary calc-btn span-2" data-action="clear">AC</button>
                                <button class="btn btn-secondary calc-btn" data-action="delete">DEL</button>
                                <button class="btn btn-primary calc-btn operator" data-action="divide">÷</button>

                                <button class="btn btn-secondary calc-btn" data-action="power">x^y</button>
                                <button class="btn btn-secondary calc-btn" data-action="square-root">√</button>
                                <button class="btn btn-secondary calc-btn" data-action="percentage">%</button>
                                <button class="btn btn-primary calc-btn operator" data-action="multiply">×</button>

                                <button class="btn btn-secondary calc-btn" data-action="sin">sin</button>
                                <button class="btn btn-secondary calc-btn" data-action="cos">cos</button>
                                <button class="btn btn-secondary calc-btn" data-action="tan">tan</button>
                                <button class="btn btn-primary calc-btn operator" data-action="subtract">−</button>

                                <button class="btn btn-secondary calc-btn" data-action="log">log</button>
                                <button class="btn btn-secondary calc-btn" data-action="ln">ln</button>
                                <button class="btn btn-secondary calc-btn" data-action="pi">π</button>
                                <button class="btn btn-primary calc-btn operator" data-action="add">+</button>

                                <button class="btn btn-secondary calc-btn" data-action="factorial">x!</button>
                                <button class="btn btn-secondary calc-btn" data-action="power-ten">10^x</button>
                                <button class="btn btn-secondary calc-btn" data-action="e">e</button>
                                <button class="btn btn-primary calc-btn operator" data-action="equals">=</button>

                                <button class="btn btn-light calc-btn" data-action="number">1</button>
                                <button class="btn btn-light calc-btn" data-action="number">2</button>
                                <button class="btn btn-light calc-btn" data-action="number">3</button>
                                <button class="btn btn-light calc-btn" data-action="number">4</button>
                                <button class="btn btn-light calc-btn" data-action="number">5</button>
                                <button class="btn btn-light calc-btn" data-action="number">6</button>
                                <button class="btn btn-light calc-btn span-2" data-action="number">7</button>
                                <button class="btn btn-light calc-btn" data-action="number">8</button>
                                <button class="btn btn-light calc-btn" data-action="number">9</button>

                                <button class="btn btn-light calc-btn span-2" data-action="number">0</button>
                                <button class="btn btn-light calc-btn" data-action="decimal">.</button>
                            </div>
                        </div>
                        <div class="tool-tips mt-3">
                            <h5><i class="fas fa-lightbulb"></i>Tips:</h5>
                            <ul>
                                <li>Use parentheses for complex calculations</li>
                                <li>Trigonometric functions use radians by default</li>
                                <li>Click "DEL" to remove the last digit</li>
                                <li>Click "AC" to clear everything</li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <section class="tool-info py-4 ">
            <div class="container">
                <h3 class="section-title">Common Construction Unit Conversions</h3>

                 <p class="text-center mb-4"></p>
                <div class="row g-4">
                    <div class="col-md-3 text-center">
                        <div class="p-3 border rounded">
                            <div class="fs-1 text-primary mb-2"><i class="fas fa-ruler"></i></div>
                            <h4>Length</h4>
                            <p>
                                1 meter = 3.28084 feet<br />
                                1 foot = 0.3048 meters<br />
                                1 inch = 25.4 millimeters
                            </p>
                        </div>
                    </div>
                    <div class="col-md-3 text-center">
                        <div class="p-3 border rounded">
                            <div class="fs-1 text-primary mb-2"><i class="fas fa-border-style"></i></div>
                            <h4>Area</h4>
                            <p>
                                1 m² = 10.764 ft²<br />
                                1 ft² = 0.0929 m²<br />
                                1 acre = 4046.86 m²
                            </p>
                        </div>
                    </div>
                    <div class="col-md-3 text-center">
                        <div class="p-3 border rounded">
                            <div class="fs-1 text-primary mb-2"><i class="fas fa-cube"></i></div>
                            <h4>Volume</h4>
                            <p>
                                1 m³ = 35.3147 ft³<br />
                                1 ft³ = 0.0283 m³<br />
                                1 liter = 0.001 m³
                            </p>
                        </div>
                    </div>
                    <div class="col-md-3 text-center">
                        <div class="p-3 border rounded">
                            <div class="fs-1 text-primary mb-2"><i class="fas fa-weight-hanging"></i></div>
                            <h4>Weight</h4>
                            <p>
                                1 kg = 2.20462 lb<br />
                                1 lb = 0.453592 kg<br />
                                1 ton = 1000 kg
                            </p>
                        </div>
                    </div>
                </div>

                <div class="tool-note mt-4 p-3 border rounded">
                    <h4><i class="fas fa-exclamation-triangle text-warning"></i>Important Note</h4>
                    <p>These conversions are based on standard values. For construction materials, actual densities and volumes may vary based on specific product characteristics and local standards.</p>
                </div>
            </div>
        </section>
    </section>

    <script>
        $(function () {
            // Tab Functionality
            $('.tab-btn').on('click', function () {
                var tabId = $(this).data('tab');
                $('.tab-btn').removeClass('btn-primary active').addClass('btn-outline-primary');
                $(this).removeClass('btn-outline-primary').addClass('btn-primary active');

                $('.tab-pane').removeClass('active').addClass('d-none');
                $('#' + tabId).removeClass('d-none').addClass('active');
            });

            // Length Converter
            $('#lengthConverter').on('submit', function (e) {
                e.preventDefault();
                var value = parseFloat($('#lengthValue').val());
                var fromUnit = $('#lengthFrom').val();
                var toUnit = $('#lengthTo').val();
                var meters = 0;
                switch (fromUnit) {
                    case 'mm': meters = value / 1000; break;
                    case 'cm': meters = value / 100; break;
                    case 'm': meters = value; break;
                    case 'in': meters = value * 0.0254; break;
                    case 'ft': meters = value * 0.3048; break;
                    case 'yd': meters = value * 0.9144; break;
                }
                var result = 0;
                switch (toUnit) {
                    case 'mm': result = meters * 1000; break;
                    case 'cm': result = meters * 100; break;
                    case 'm': result = meters; break;
                    case 'in': result = meters / 0.0254; break;
                    case 'ft': result = meters / 0.3048; break;
                    case 'yd': result = meters / 0.9144; break;
                }
                $('#lengthResult').text(result.toFixed(4));
                $('#lengthResultLabel').text(toUnit);
                $('#lengthResults').removeClass('d-none');
            });

            // Area Converter
            $('#areaConverter').on('submit', function (e) {
                e.preventDefault();
                var value = parseFloat($('#areaValue').val());
                var fromUnit = $('#areaFrom').val();
                var toUnit = $('#areaTo').val();
                var sqMeters = 0;
                switch (fromUnit) {
                    case 'mm2': sqMeters = value / 1000000; break;
                    case 'cm2': sqMeters = value / 10000; break;
                    case 'm2': sqMeters = value; break;
                    case 'ft2': sqMeters = value * 0.092903; break;
                    case 'yd2': sqMeters = value * 0.836127; break;
                    case 'acre': sqMeters = value * 4046.86; break;
                    case 'hectare': sqMeters = value * 10000; break;
                }
                var result = 0;
                switch (toUnit) {
                    case 'mm2': result = sqMeters * 1000000; break;
                    case 'cm2': result = sqMeters * 10000; break;
                    case 'm2': result = sqMeters; break;
                    case 'ft2': result = sqMeters / 0.092903; break;
                    case 'yd2': result = sqMeters / 0.836127; break;
                    case 'acre': result = sqMeters / 4046.86; break;
                    case 'hectare': result = sqMeters / 10000; break;
                }
                $('#areaResult').text(result.toFixed(4));
                $('#areaResultLabel').text(toUnit);
                $('#areaResults').removeClass('d-none');
            });

            // Volume Converter
            $('#volumeConverter').on('submit', function (e) {
                e.preventDefault();
                var value = parseFloat($('#volumeValue').val());
                var fromUnit = $('#volumeFrom').val();
                var toUnit = $('#volumeTo').val();
                var cuMeters = 0;
                switch (fromUnit) {
                    case 'mm3': cuMeters = value / 1000000000; break;
                    case 'cm3': cuMeters = value / 1000000; break;
                    case 'm3': cuMeters = value; break;
                    case 'in3': cuMeters = value * 0.000016387064; break;
                    case 'ft3': cuMeters = value * 0.028316846592; break;
                    case 'yd3': cuMeters = value * 0.764554857984; break;
                    case 'liter': cuMeters = value / 1000; break;
                    case 'gallon': cuMeters = value * 0.00378541; break;
                }
                var result = 0;
                switch (toUnit) {
                    case 'mm3': result = cuMeters * 1000000000; break;
                    case 'cm3': result = cuMeters * 1000000; break;
                    case 'm3': result = cuMeters; break;
                    case 'in3': result = cuMeters / 0.000016387064; break;
                    case 'ft3': result = cuMeters / 0.028316846592; break;
                    case 'yd3': result = cuMeters / 0.764554857984; break;
                    case 'liter': result = cuMeters * 1000; break;
                    case 'gallon': result = cuMeters / 0.00378541; break;
                }
                $('#volumeResult').text(result.toFixed(4));
                $('#volumeResultLabel').text(toUnit);
                $('#volumeResults').removeClass('d-none');
            });

            // Weight Converter
            $('#weightConverter').on('submit', function (e) {
                e.preventDefault();
                var value = parseFloat($('#weightValue').val());
                var fromUnit = $('#weightFrom').val();
                var toUnit = $('#weightTo').val();
                var kg = 0;
                switch (fromUnit) {
                    case 'mg': kg = value / 1000000; break;
                    case 'g': kg = value / 1000; break;
                    case 'kg': kg = value; break;
                    case 'ton': kg = value * 1000; break;
                    case 'oz': kg = value * 0.0283495; break;
                    case 'lb': kg = value * 0.453592; break;
                }
                var result = 0;
                switch (toUnit) {
                    case 'mg': result = kg * 1000000; break;
                    case 'g': result = kg * 1000; break;
                    case 'kg': result = kg; break;
                    case 'ton': result = kg / 1000; break;
                    case 'oz': result = kg / 0.0283495; break;
                    case 'lb': result = kg / 0.453592; break;
                }
                $('#weightResult').text(result.toFixed(4));
                $('#weightResultLabel').text(toUnit);
                $('#weightResults').removeClass('d-none');
            });

            // Rate Calculator
            $('#rateCalculator').on('submit', function (e) {
                e.preventDefault();
                var value = parseFloat($('#rateValue').val());
                var fromUnit = $('#rateFrom').val();
                var toUnit = $('#rateTo').val();
                var quantity = parseFloat($('#quantity').val()) || 1;

                var perSqM = 0;
                switch (fromUnit) {
                    case 'sqft': perSqM = value / 0.092903; break;
                    case 'sqm': perSqM = value; break;
                    case 'sqyd': perSqM = value / 0.836127; break;
                    case 'cft': perSqM = value / 0.0283168; break;
                    case 'cum': perSqM = value; break;
                    case 'kg': perSqM = value; break;
                    case 'ton': perSqM = value * 1000; break;
                    case 'piece': perSqM = value; break;
                }
                var result = 0;
                switch (toUnit) {
                    case 'sqft': result = perSqM * 0.092903; break;
                    case 'sqm': result = perSqM; break;
                    case 'sqyd': result = perSqM * 0.836127; break;
                    case 'cft': result = perSqM * 0.0283168; break;
                    case 'cum': result = perSqM; break;
                    case 'kg': result = perSqM; break;
                    case 'ton': result = perSqM / 1000; break;
                    case 'piece': result = perSqM; break;
                }
                var totalCost = result * quantity;
                $('#rateResult').text(result.toFixed(2));
                $('#rateResultLabel').text('per ' + toUnit);
                if (quantity > 1) {
                    $('#totalCost').text(totalCost.toFixed(2));
                    $('#totalCostContainer').removeClass('d-none');
                } else {
                    $('#totalCostContainer').addClass('d-none');
                }
                $('#rateResults').removeClass('d-none');
            });

            // Scientific Calculator
            class Calculator {
                constructor($previousOperandElement, $currentOperandElement) {
                    this.$previousOperandElement = $previousOperandElement;
                    this.$currentOperandElement = $currentOperandElement;
                    this.clear();
                }
                clear() {
                    this.currentOperand = '0';
                    this.previousOperand = '';
                    this.operation = undefined;
                    this.resetScreen = false;
                }
                delete() {
                    this.currentOperand = this.currentOperand.toString().slice(0, -1);
                    if (this.currentOperand === '') {
                        this.currentOperand = '0';
                    }
                }
                appendNumber(number) {
                    if (number === '.' && this.currentOperand.includes('.')) return;
                    if (this.currentOperand === '0' && number !== '.') {
                        this.currentOperand = number;
                    } else {
                        if (this.resetScreen) {
                            this.currentOperand = number;
                            this.resetScreen = false;
                        } else {
                            this.currentOperand = this.currentOperand.toString() + number.toString();
                        }
                    }
                }
                chooseOperation(operation) {
                    if (this.currentOperand === '') return;
                    if (this.previousOperand !== '') {
                        this.compute();
                    }
                    this.operation = operation;
                    this.previousOperand = this.currentOperand;
                    this.currentOperand = '';
                }
                compute() {
                    let computation;
                    const prev = parseFloat(this.previousOperand);
                    const current = parseFloat(this.currentOperand);
                    if (isNaN(prev) || isNaN(current)) return;
                    switch (this.operation) {
                        case '+':
                            computation = prev + current;
                            break;
                        case '−':
                            computation = prev - current;
                            break;
                        case '×':
                            computation = prev * current;
                            break;
                        case '÷':
                            computation = prev / current;
                            break;
                        case 'x^y':
                            computation = Math.pow(prev, current);
                            break;
                        default:
                            return;
                    }
                    this.currentOperand = computation.toString();
                    this.operation = undefined;
                    this.previousOperand = '';
                    this.resetScreen = true;
                }
                scientificFunction(func) {
                    const current = parseFloat(this.currentOperand);
                    if (isNaN(current)) return;
                    let computation;
                    switch (func) {
                        case 'square-root':
                            computation = Math.sqrt(current);
                            break;
                        case 'percentage':
                            computation = current / 100;
                            break;
                        case 'sin':
                            computation = Math.sin(current);
                            break;
                        case 'cos':
                            computation = Math.cos(current);
                            break;
                        case 'tan':
                            computation = Math.tan(current);
                            break;
                        case 'log':
                            computation = Math.log10(current);
                            break;
                        case 'ln':
                            computation = Math.log(current);
                            break;
                        case 'pi':
                            computation = Math.PI;
                            break;
                        case 'e':
                            computation = Math.E;
                            break;
                        case 'factorial':
                            computation = this.factorial(current);
                            break;
                        case 'power-ten':
                            computation = Math.pow(10, current);
                            break;
                        default:
                            return;
                    }
                    this.currentOperand = computation.toString();
                    this.resetScreen = true;
                }
                factorial(n) {
                    if (n < 0) return NaN;
                    if (n <= 1) return 1;
                    let result = 1;
                    for (let i = 2; i <= n; i++) {
                        result *= i;
                    }
                    return result;
                }
                updateDisplay() {
                    this.$currentOperandElement.text(this.currentOperand);
                    if (this.operation != null) {
                        this.$previousOperandElement.text(`${this.previousOperand} ${this.operation}`);
                    } else {
                        this.$previousOperandElement.text('');
                    }
                }
            }

            const $previousOperandElement = $('#previousOperand');
            const $currentOperandElement = $('#currentOperand');
            const calculator = new Calculator($previousOperandElement, $currentOperandElement);

            $('.calc-btn').on('click', function () {
                const action = $(this).data('action');
                const buttonText = $(this).text();

                if (action === 'number') {
                    calculator.appendNumber(buttonText);
                } else if (action === 'decimal') {
                    calculator.appendNumber('.');
                } else if (action === 'clear') {
                    calculator.clear();
                } else if (action === 'delete') {
                    calculator.delete();
                } else if (action === 'equals') {
                    calculator.compute();
                } else if (['sin', 'cos', 'tan', 'log', 'ln', 'pi', 'e', 'factorial', 'power-ten', 'square-root', 'percentage'].includes(action)) {
                    calculator.scientificFunction(action);
                } else {
                    calculator.chooseOperation(buttonText);
                }
                calculator.updateDisplay();
            });

            // Initialize first tab
            $('.tab-btn.active').trigger('click');
        });
    </script>

</main>


</asp:Content>
