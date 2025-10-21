<%@ Page Title="Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Floor_Planner.aspx.cs" Inherits="CMC.Pages.Tool.Floor_Planner" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <main class="content">


    <section>

        <!-- Page Hero Section -->
        <section class="page-hero">
            <div class="container">
                <h1 class="display-4 fw-bold ">Floor Plan Creator</h1>
                <p class="lead">Design your dream home layout with our interactive tool</p>
            </div>
        </section>

        <section class="py-5 filter-row-button-section ">
            <div class="container">
                <div class="tool-nav mb-3 d-flex gap-3">
                    <a href="/Pages/Tool/Material_Calculator" class=" btn btn-outline-secondary"><i class="fas fa-calculator"></i>Material Calculator</a>
                    <a href="/Pages/Tool/Roof_Calculator" class="btn btn-outline-secondary"><i class="fas fa-home"></i>Roof Calculator</a>
                    <a href="/Pages/Tool/Floor_Planner" class=" active btn btn-outline-primary"><i class="fas fa-ruler-combined"></i>Floor Planner</a>
                    <a href="/Pages/Tool/Unit_Convertor" class="btn btn-outline-secondary"><i class="fas fa-exchange-alt"></i>Unit Converter</a>
                </div>
            </div>
        </section>

        <!-- Tool Container Section -->
        <section class="tool-container py-4">
            <div class="container">


                <div class="planner-wrapper">
                    <div class="planner-controls">
                        <h3>Design Tools</h3>
                        <div class="control-group">
                            <button id="btnWall" class="btn-control btn btn-primary active"><i class="bi bi-border-style"></i>Walls</button>
                            <button id="btnDoor" class="btn-control btn btn-outline-primary"><i class="bi bi-door-open"></i>Doors</button>
                            <button id="btnWindow" class="btn-control btn btn-outline-primary"><i class="bi bi-window"></i>Windows</button>
                        </div>

                        <div class="control-group">
                            <button id="btnRoom" class="btn-control btn btn-outline-primary"><i class="bi bi-aspect-ratio"></i>Rooms</button>
                            <button id="btnFurniture" class="btn-control btn btn-outline-primary"><i class="bi bi-lamp"></i>Furniture</button>
                            <button id="btnDelete" class="btn-control btn btn-outline-danger"><i class="bi bi-trash"></i>Delete</button>
                        </div>

                        <div class="control-group dimensions">
                            <label for="wallLength" class="form-label">Length (ft):</label>
                            <input type="number" id="wallLength" class="form-control" min="1" max="100" value="10">

                            <label for="wallThickness" class="form-label mt-2">Thickness (in):</label>
                            <select id="wallThickness" class="form-select">
                                <option value="4">4 inches</option>
                                <option value="6" selected>6 inches</option>
                                <option value="8">8 inches</option>
                            </select>
                        </div>

                        <div class="control-group">
                            <button id="btnUndo" class="btn-control btn btn-outline-secondary"><i class="bi bi-arrow-counterclockwise"></i>Undo</button>
                            <button id="btnClear" class="btn-control btn btn-outline-warning"><i class="bi bi-x-circle"></i>Clear All</button>
                            <button id="btnSave" class="btn-control btn btn-outline-success"><i class="bi bi-floppy"></i>Save</button>
                        </div>

                        <div class="room-list">
                            <h4>Room Dimensions</h4>
                            <div id="roomDimensions">
                                <div class="empty-state">
                                    <i class="bi bi-pencil-square" style="font-size: 2rem;"></i>
                                    <p class="mt-2">Start drawing to see room measurements</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="planner-canvas-container">
                        <div class="canvas-actions">
                            <button id="btnZoomIn" class="btn-icon btn btn-light"><i class="bi bi-zoom-in"></i></button>
                            <button id="btnZoomOut" class="btn-icon btn btn-light"><i class="bi bi-zoom-out"></i></button>
                            <button id="btnCenter" class="btn-icon btn btn-light"><i class="bi bi-fullscreen"></i></button>
                            <button id="btnGrid" class="btn-icon btn btn-primary"><i class="bi bi-grid-3x3"></i></button>
                        </div>
                        <div class="canvas-wrapper">
                            <canvas id="floorCanvas" width="1000" height="800"></canvas>
                            <div class="cursor-coords">X: 0 ft, Y: 0 ft</div>
                        </div>
                        <div class="scale-indicator">
                            <div class="scale-bar"></div>
                            <span>10 ft</span>
                        </div>
                    </div>

                    <div class="planner-library">
                        <h3>Furniture Library</h3>
                        <div class="library-tabs nav nav-pills">
                            <button class="lib-tab nav-link active" data-category="living">Living</button>
                            <button class="lib-tab nav-link" data-category="bedroom">Bedroom</button>
                            <button class="lib-tab nav-link" data-category="kitchen">Kitchen</button>
                            <button class="lib-tab nav-link" data-category="bathroom">Bathroom</button>
                        </div>

                        <div class="library-items">
                            <div class="lib-category active" id="living">
                                <div class="lib-item" data-type="sofa" data-width="6" data-depth="3">
                                    <div class="item-preview sofa"></div>
                                    <span>Sofa (6'x3')</span>
                                </div>
                                <div class="lib-item" data-type="armchair" data-width="3" data-depth="3">
                                    <div class="item-preview armchair"></div>
                                    <span>Armchair (3'x3')</span>
                                </div>
                                <div class="lib-item" data-type="coffee-table" data-width="4" data-depth="2">
                                    <div class="item-preview coffee-table"></div>
                                    <span>Coffee Table (4'x2')</span>
                                </div>
                                <div class="lib-item" data-type="tv-stand" data-width="6" data-depth="2">
                                    <div class="item-preview tv-stand"></div>
                                    <span>TV Stand (6'x2')</span>
                                </div>
                            </div>

                            <div class="lib-category" id="bedroom">
                                <div class="lib-item" data-type="bed" data-width="6" data-depth="7">
                                    <div class="item-preview bed"></div>
                                    <span>Bed (6'x7')</span>
                                </div>
                                <div class="lib-item" data-type="wardrobe" data-width="4" data-depth="2">
                                    <div class="item-preview wardrobe"></div>
                                    <span>Wardrobe (4'x2')</span>
                                </div>
                                <div class="lib-item" data-type="nightstand" data-width="2" data-depth="2">
                                    <div class="item-preview nightstand"></div>
                                    <span>Nightstand (2'x2')</span>
                                </div>
                                <div class="lib-item" data-type="dresser" data-width="5" data-depth="2">
                                    <div class="item-preview dresser"></div>
                                    <span>Dresser (5'x2')</span>
                                </div>
                            </div>

                            <div class="lib-category" id="kitchen">
                                <div class="lib-item" data-type="refrigerator" data-width="3" data-depth="3">
                                    <div class="item-preview refrigerator"></div>
                                    <span>Refrigerator (3'x3')</span>
                                </div>
                                <div class="lib-item" data-type="kitchen-cabinet" data-width="6" data-depth="2">
                                    <div class="item-preview kitchen-cabinet"></div>
                                    <span>Cabinet (6'x2')</span>
                                </div>
                                <div class="lib-item" data-type="stove" data-width="3" data-depth="2">
                                    <div class="item-preview stove"></div>
                                    <span>Stove (3'x2')</span>
                                </div>
                                <div class="lib-item" data-type="dining-table" data-width="5" data-depth="4">
                                    <div class="item-preview dining-table"></div>
                                    <span>Dining Table (5'x4')</span>
                                </div>
                            </div>

                            <div class="lib-category" id="bathroom">
                                <div class="lib-item" data-type="toilet" data-width="2" data-depth="3">
                                    <div class="item-preview toilet"></div>
                                    <span>Toilet (2'x3')</span>
                                </div>
                                <div class="lib-item" data-type="sink" data-width="2" data-depth="2">
                                    <div class="item-preview sink"></div>
                                    <span>Sink (2'x2')</span>
                                </div>
                                <div class="lib-item" data-type="bathtub" data-width="5" data-depth="3">
                                    <div class="item-preview bathtub"></div>
                                    <span>Bathtub (5'x3')</span>
                                </div>
                                <div class="lib-item" data-type="shower" data-width="3" data-depth="3">
                                    <div class="item-preview shower"></div>
                                    <span>Shower (3'x3')</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="planner-export">
                    <h3>Export Your Design</h3>
                    <div class="export-options">
                        <button id="btnExportImage" class="btn btn-primary"><i class="bi bi-image"></i>Save as Image</button>
                        <button id="btnExportPDF" class="btn btn-danger"><i class="bi bi-file-earmark-pdf"></i>Export as PDF</button>
                        <button id="btnPrint" class="btn btn-secondary"><i class="bi bi-printer"></i>Print Plan</button>
                    </div>
                    <div class="export-note mt-3">
                        <p class="text-muted"><i class="bi bi-info-circle"></i>For professional construction plans, contact our design team</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Tool Info Section -->
        <section class="tool-info ">
            <div class="container">
                <h3 class="text-center mb-4 section-title">Floor Plan Design Tips</h3>
                <div class="info-grid">
                    <div class="info-card">
                        <div class="info-icon text-center"><i class="bi bi-rulers"></i></div>
                        <h4 class="text-center section-title">Standard Dimensions</h4>
                        <ul class="list-group ">
                            <li class="list-group-item">Doors: 3' wide, 7' tall</li>
                            <li class="list-group-item">Hallways: Minimum 3' wide</li>
                            <li class="list-group-item">Kitchen work triangle: 12'-26' total</li>
                            <li class="list-group-item">Staircases: Minimum 3' wide</li>
                        </ul>
                    </div>
                    <div class="info-card">
                        <div class="info-icon text-center"><i class="bi bi-lightbulb"></i></div>
                        <h4 class="text-center section-title">Standard Design Principles</h4>
                        <ul class="list-group ">
                            <li class="list-group-item">Group rooms by function</li>
                            <li class="list-group-item">Consider natural light sources</li>
                            <li class="list-group-item">Plan furniture placement early</li>
                            <li class="list-group-item">Allow for proper circulation</li>
                        </ul>
                    </div>
                    <div class="info-card">
                        <div class="info-icon text-center"><i class="bi bi-house"></i></div>
                        <h4 class="text-center section-title">Village Considerations</h4>
                        <ul class="list-group ">
                            <li class="list-group-item">Traditional architectural styles</li>
                            <li class="list-group-item">Local climate adaptations</li>
                            <li class="list-group-item">Family gathering spaces</li>
                            <li class="list-group-item">Outdoor connections</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
    </section>


    <style>
        .planner-wrapper {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 30px;
        }

        .planner-controls, .planner-library {
            flex: 1;
            min-width: 300px;
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            height: fit-content;
        }

        .planner-canvas-container {
            flex: 2;
            min-width: 500px;
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            position: relative;
        }

        .btn-control {
            margin-bottom: 10px;
            width: 100%;
            text-align: left;
        }

        .control-group {
            margin-bottom: 20px;
        }

        .canvas-wrapper {
            position: relative;
            border: 1px solid #dee2e6;
            background-color: white;
            overflow: hidden;
            height: 600px;
        }

        #floorCanvas {
            background-color: white;
            cursor: crosshair;
        }

        .canvas-actions {
            position: absolute;
            top: 25px;
            right: 25px;
            z-index: 10;
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .btn-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .cursor-coords {
            position: absolute;
            bottom: 10px;
            left: 10px;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 12px;
        }

        .scale-indicator {
            position: absolute;
            bottom: 10px;
            right: 10px;
            display: flex;
            align-items: center;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 12px;
        }

        .scale-bar {
            width: 50px;
            height: 2px;
            background-color: white;
            margin-right: 10px;
        }

        .library-tabs {
            display: flex;
            gap: 5px;
            margin-bottom: 15px;
        }

        .lib-tab {
            flex: 1;
            padding: 5px;
            font-size: 12px;
            text-align: center;
        }

        .library-items {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
        }

        .lib-item {
            background-color: white;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
        }

            .lib-item:hover {
                background-color: #e9ecef;
            }

        .item-preview {
            height: 50px;
            margin-bottom: 5px;
            background-color: #dee2e6;
            border-radius: 3px;
        }

        .sofa {
            background-color: #795548;
        }

        .armchair {
            background-color: #5d4037;
        }

        .coffee-table {
            background-color: #6d4c41;
        }

        .tv-stand {
            background-color: #4e342e;
        }

        .bed {
            background-color: #5e35b1;
        }

        .wardrobe {
            background-color: #4527a0;
        }

        .nightstand {
            background-color: #7e57c2;
        }

        .dresser {
            background-color: #673ab7;
        }

        .refrigerator {
            background-color: #303f9f;
        }

        .kitchen-cabinet {
            background-color: #283593;
        }

        .stove {
            background-color: #3949ab;
        }

        .dining-table {
            background-color: #1a237e;
        }

        .toilet {
            background-color: #00796b;
        }

        .sink {
            background-color: #004d40;
        }

        .bathtub {
            background-color: #00897b;
        }

        .shower {
            background-color: #00695c;
        }

        .room-list {
            margin-top: 20px;
        }

        .room-dimension {
            display: flex;
            justify-content: space-between;
            padding: 5px 0;
            border-bottom: 1px solid #dee2e6;
        }

        .empty-state {
            text-align: center;
            color: #6c757d;
            padding: 20px;
        }

        .planner-export {
            background-color: #f8f9fa;
            padding: 30px;
            border-radius: 8px;
            text-align: center;
            margin-bottom: 30px;
        }

        .export-options {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin: 20px 0;
            flex-wrap: wrap;
        }

        .tool-info {
            padding: 50px 0;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .info-card {
            background-color: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            height: 100%;
        }

        .info-icon {
            font-size: 2.5rem;
            color: #0d6efd;
            margin-bottom: 15px;
        }

        @media (max-width: 1200px) {
            .planner-wrapper {
                flex-direction: column;
            }

            .planner-controls, .planner-library, .planner-canvas-container {
                min-width: 100%;
            }
        }
    </style>


    <script>
        $(document).ready(function () {
            // Canvas setup
            const canvas = document.getElementById('floorCanvas');
            const ctx = canvas.getContext('2d');
            const cursorCoords = $('.cursor-coords');
            const scaleIndicator = $('.scale-indicator span');
            const roomDimensions = $('#roomDimensions');

            // Drawing state
            let isDrawing = false;
            let currentTool = 'wall';
            let startX, startY;
            let currentX, currentY;
            let scale = 1; // Pixels per foot
            let offsetX = 0, offsetY = 0;
            let dragStart = null;
            let showGrid = true;

            // Store all drawn elements
            let elements = {
                walls: [],
                doors: [],
                windows: [],
                rooms: [],
                furniture: []
            };

            // Undo history
            let history = [];
            const MAX_HISTORY = 50;

            // Initialize with default wall thickness and length
            let wallThickness = 6; // inches
            let wallLength = 10; // feet
            let selectedFurniture = null;

            // Initialize canvas
            resizeCanvas();
            drawCanvas();

            // Event listeners for canvas
            $(canvas).on('mousedown', handleMouseDown);
            $(canvas).on('mousemove', handleMouseMove);
            $(canvas).on('mouseup', handleMouseUp);
            $(canvas).on('wheel', handleWheel);
            $(canvas).on('mouseleave', handleMouseLeave);

            // Event listeners for tools
            $('#btnWall').on('click', () => setTool('wall'));
            $('#btnDoor').on('click', () => setTool('door'));
            $('#btnWindow').on('click', () => setTool('window'));
            $('#btnRoom').on('click', () => setTool('room'));
            $('#btnFurniture').on('click', () => setTool('furniture'));
            $('#btnDelete').on('click', () => setTool('delete'));

            // Event listeners for actions
            $('#btnUndo').on('click', undoAction);
            $('#btnClear').on('click', clearCanvas);
            $('#btnSave').on('click', saveDesign);
            $('#btnZoomIn').on('click', () => zoom(1.2));
            $('#btnZoomOut').on('click', () => zoom(0.8));
            $('#btnCenter').on('click', centerView);
            $('#btnGrid').on('click', toggleGrid);

            // Event listeners for export
            $('#btnExportImage').on('click', exportAsImage);
            $('#btnExportPDF').on('click', exportAsPDF);
            $('#btnPrint').on('click', printPlan);

            // Event listeners for furniture library
            $('.lib-tab').on('click', function () {
                $('.lib-tab').removeClass('active');
                $(this).addClass('active');

                const category = $(this).data('category');
                $('.lib-category').removeClass('active');
                $('#' + category).addClass('active');
            });

            $('.lib-item').on('click', function () {
                if (currentTool === 'furniture') {
                    const type = $(this).data('type');
                    const width = parseFloat($(this).data('width'));
                    const depth = parseFloat($(this).data('depth'));

                    // Store selected furniture for placement
                    selectedFurniture = { type, width, depth };

                    // Change cursor to indicate placement mode
                    $(canvas).css('cursor', 'crosshair');
                }
            });

            // Wall thickness and length change handlers
            $('#wallThickness').on('change', function () {
                wallThickness = parseInt($(this).val());
            });

            $('#wallLength').on('change', function () {
                wallLength = parseInt($(this).val());
            });

            // Window resize handler
            $(window).on('resize', function () {
                resizeCanvas();
                drawCanvas();
            });

            // Functions
            function resizeCanvas() {
                const container = $(canvas).parent();
                canvas.width = container.width();
                canvas.height = container.height();
            }

            function drawCanvas() {
                // Clear canvas
                ctx.clearRect(0, 0, canvas.width, canvas.height);

                // Draw grid if enabled
                if (showGrid) {
                    drawGrid();
                }

                // Draw all elements
                drawAllElements();

                // Draw current drawing (if in progress)
                if (isDrawing) {
                    drawCurrentElement();
                }
            }

            function drawGrid() {
                const gridSize = 12 * scale; // 1 foot grid
                const dashLength = 2;

                ctx.strokeStyle = '#e0e0e0';
                ctx.lineWidth = 1;

                // Vertical lines
                for (let x = offsetX % gridSize; x < canvas.width; x += gridSize) {
                    ctx.beginPath();
                    ctx.moveTo(x, 0);
                    ctx.lineTo(x, canvas.height);
                    ctx.stroke();
                }

                // Horizontal lines
                for (let y = offsetY % gridSize; y < canvas.height; y += gridSize) {
                    ctx.beginPath();
                    ctx.moveTo(0, y);
                    ctx.lineTo(canvas.width, y);
                    ctx.stroke();
                }

                // Draw major grid lines (every 5 feet)
                ctx.strokeStyle = '#bdbdbd';
                ctx.lineWidth = 1.5;

                // Vertical major lines
                for (let x = offsetX % (gridSize * 5); x < canvas.width; x += gridSize * 5) {
                    ctx.beginPath();
                    ctx.moveTo(x, 0);
                    ctx.lineTo(x, canvas.height);
                    ctx.stroke();
                }

                // Horizontal major lines
                for (let y = offsetY % (gridSize * 5); y < canvas.height; y += gridSize * 5) {
                    ctx.beginPath();
                    ctx.moveTo(0, y);
                    ctx.lineTo(canvas.width, y);
                    ctx.stroke();
                }
            }

            function drawAllElements() {
                // Draw rooms first (background)
                elements.rooms.forEach(room => {
                    drawRoom(room);
                });

                // Then walls
                elements.walls.forEach(wall => {
                    drawWall(wall);
                });

                // Then doors and windows
                elements.doors.forEach(door => {
                    drawDoor(door);
                });

                elements.windows.forEach(window => {
                    drawWindow(window);
                });

                // Finally furniture (top layer)
                elements.furniture.forEach(item => {
                    drawFurniture(item);
                });
            }

            function drawCurrentElement() {
                ctx.save();
                ctx.setLineDash([5, 3]);
                ctx.strokeStyle = '#666';

                switch (currentTool) {
                    case 'wall':
                        ctx.lineWidth = wallThickness * scale / 12;
                        ctx.beginPath();
                        ctx.moveTo(startX, startY);
                        ctx.lineTo(currentX, currentY);
                        ctx.stroke();
                        break;

                    case 'room':
                        ctx.fillStyle = 'rgba(100, 149, 237, 0.2)';
                        ctx.strokeStyle = 'rgba(100, 149, 237, 0.8)';
                        ctx.lineWidth = 2;
                        drawRectangle(startX, startY, currentX - startX, currentY - startY);
                        break;

                    case 'furniture':
                        if (selectedFurniture) {
                            const width = selectedFurniture.width * scale;
                            const depth = selectedFurniture.depth * scale;
                            ctx.fillStyle = 'rgba(169, 169, 169, 0.3)';
                            ctx.strokeStyle = 'rgba(105, 105, 105, 0.8)';
                            ctx.lineWidth = 2;
                            drawRectangle(currentX - width / 2, currentY - depth / 2, width, depth);
                        }
                        break;
                }

                ctx.restore();
            }

            function drawWall(wall) {
                ctx.save();
                ctx.lineWidth = wall.thickness * scale / 12;
                ctx.strokeStyle = '#333';

                ctx.beginPath();
                ctx.moveTo(wall.x1 * scale + offsetX, wall.y1 * scale + offsetY);
                ctx.lineTo(wall.x2 * scale + offsetX, wall.y2 * scale + offsetY);
                ctx.stroke();

                ctx.restore();
            }

            function drawDoor(door) {
                ctx.save();

                // Calculate door position and angle
                const x1 = door.x1 * scale + offsetX;
                const y1 = door.y1 * scale + offsetY;
                const x2 = door.x2 * scale + offsetX;
                const y2 = door.y2 * scale + offsetY;

                const length = Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
                const angle = Math.atan2(y2 - y1, x2 - x1);

                // Draw door frame
                ctx.translate(x1, y1);
                ctx.rotate(angle);

                ctx.strokeStyle = '#8B4513';
                ctx.lineWidth = 4;
                ctx.beginPath();
                ctx.moveTo(0, 0);
                ctx.lineTo(length, 0);
                ctx.stroke();

                // Draw door
                ctx.fillStyle = '#CD853F';
                ctx.beginPath();
                ctx.arc(length - 3, 0, 3, 0, Math.PI * 2);
                ctx.fill();

                ctx.restore();
            }

            function drawWindow(window) {
                ctx.save();

                const x1 = window.x1 * scale + offsetX;
                const y1 = window.y1 * scale + offsetY;
                const x2 = window.x2 * scale + offsetX;
                const y2 = window.y2 * scale + offsetY;

                const length = Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
                const angle = Math.atan2(y2 - y1, x2 - x1);

                ctx.translate(x1, y1);
                ctx.rotate(angle);

                // Window frame
                ctx.strokeStyle = '#4682B4';
                ctx.lineWidth = 6;
                ctx.beginPath();
                ctx.moveTo(0, 0);
                ctx.lineTo(length, 0);
                ctx.stroke();

                // Window panes
                ctx.strokeStyle = '#E6F3FA';
                ctx.lineWidth = 1;
                const paneCount = Math.floor(length / (20 * scale));

                for (let i = 1; i <= paneCount; i++) {
                    const x = (length / (paneCount + 1)) * i;
                    ctx.beginPath();
                    ctx.moveTo(x, -3);
                    ctx.lineTo(x, 3);
                    ctx.stroke();
                }

                ctx.restore();
            }

            function drawRoom(room) {
                ctx.save();

                ctx.fillStyle = 'rgba(100, 149, 237, 0.1)';
                ctx.strokeStyle = 'rgba(100, 149, 237, 0.5)';
                ctx.lineWidth = 2;

                drawRectangle(
                    room.x * scale + offsetX,
                    room.y * scale + offsetY,
                    room.width * scale,
                    room.height * scale
                );

                // Room label
                if (room.width * scale > 50 && room.height * scale > 30) {
                    ctx.fillStyle = 'rgba(100, 149, 237, 0.7)';
                    ctx.font = `${Math.min(room.width * scale / 10, 14)}px Arial`;
                    ctx.textAlign = 'center';
                    ctx.textBaseline = 'middle';
                    ctx.fillText(
                        room.label || 'Room',
                        room.x * scale + offsetX + room.width * scale / 2,
                        room.y * scale + offsetY + room.height * scale / 2
                    );
                }

                ctx.restore();
            }

            function drawFurniture(item) {
                ctx.save();

                const x = item.x * scale + offsetX;
                const y = item.y * scale + offsetY;
                const width = item.width * scale;
                const depth = item.depth * scale;
                const rotation = item.rotation || 0;

                ctx.translate(x + width / 2, y + depth / 2);
                ctx.rotate(rotation * Math.PI / 180);

                // Furniture color based on type
                let color = '#8d6e63'; // Default brown

                switch (item.type) {
                    case 'sofa':
                    case 'armchair':
                        color = '#795548';
                        break;
                    case 'coffee-table':
                    case 'tv-stand':
                        color = '#6d4c41';
                        break;
                    case 'bed':
                    case 'wardrobe':
                    case 'nightstand':
                    case 'dresser':
                        color = '#5e35b1';
                        break;
                    case 'refrigerator':
                    case 'kitchen-cabinet':
                    case 'stove':
                        color = '#303f9f';
                        break;
                    case 'toilet':
                    case 'sink':
                    case 'bathtub':
                    case 'shower':
                        color = '#00796b';
                        break;
                }

                ctx.fillStyle = color;
                ctx.strokeStyle = '#333';
                ctx.lineWidth = 1;

                // Draw different shapes based on furniture type
                switch (item.type) {
                    case 'sofa':
                        drawRoundedRectangle(-width / 2, -depth / 2, width, depth, 5);
                        break;
                    case 'dining-table':
                        ctx.beginPath();
                        ctx.ellipse(0, 0, width / 2, depth / 2, 0, 0, Math.PI * 2);
                        ctx.fill();
                        ctx.stroke();
                        break;
                    case 'toilet':
                        ctx.beginPath();
                        ctx.ellipse(0, depth / 4, width / 2, depth / 2, 0, 0, Math.PI);
                        ctx.fill();
                        ctx.stroke();
                        break;
                    default:
                        drawRectangle(-width / 2, -depth / 2, width, depth);
                }

                ctx.restore();
            }

            function drawRectangle(x, y, width, height) {
                ctx.beginPath();
                ctx.rect(x, y, width, height);
                ctx.fill();
                ctx.stroke();
            }

            function drawRoundedRectangle(x, y, width, height, radius) {
                ctx.beginPath();
                ctx.moveTo(x + radius, y);
                ctx.lineTo(x + width - radius, y);
                ctx.quadraticCurveTo(x + width, y, x + width, y + radius);
                ctx.lineTo(x + width, y + height - radius);
                ctx.quadraticCurveTo(x + width, y + height, x + width - radius, y + height);
                ctx.lineTo(x + radius, y + height);
                ctx.quadraticCurveTo(x, y + height, x, y + height - radius);
                ctx.lineTo(x, y + radius);
                ctx.quadraticCurveTo(x, y, x + radius, y);
                ctx.closePath();
                ctx.fill();
                ctx.stroke();
            }

            function handleMouseDown(e) {
                const rect = canvas.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;

                if (e.button === 0) { // Left click
                    if (currentTool === 'delete') {
                        // Delete element under cursor
                        deleteElementAt(x, y);
                    } else {
                        // Start drawing
                        isDrawing = true;
                        startX = x;
                        startY = y;
                        currentX = x;
                        currentY = y;
                    }
                } else if (e.button === 1 || e.button === 2) { // Middle or right click
                    // Start panning
                    dragStart = { x, y };
                    $(canvas).css('cursor', 'grabbing');
                }
            }

            function handleMouseMove(e) {
                const rect = canvas.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;

                // Update cursor coordinates display
                const worldX = (x - offsetX) / scale;
                const worldY = (y - offsetY) / scale;
                cursorCoords.text(`X: ${worldX.toFixed(1)} ft, Y: ${worldY.toFixed(1)} ft`);

                if (isDrawing) {
                    // Update current position while drawing
                    currentX = x;
                    currentY = y;
                    drawCanvas();
                } else if (dragStart) {
                    // Pan the canvas
                    offsetX += x - dragStart.x;
                    offsetY += y - dragStart.y;
                    dragStart = { x, y };
                    drawCanvas();
                }

                // Update cursor based on tool
                if (!dragStart) {
                    if (currentTool === 'delete') {
                        $(canvas).css('cursor', 'url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\' width=\'24\' height=\'24\' viewBox=\'0 0 24 24\' fill=\'none\' stroke=\'%23e74c3c\' stroke-width=\'2\' stroke-linecap=\'round\' stroke-linejoin=\'round\'><line x1=\'18\' y1=\'6\' x2=\'6\' y2=\'18\'></line><line x1=\'6\' y1=\'6\' x2=\'18\' y2=\'18\'></line></svg>") 12 12, auto');
                    } else if (currentTool === 'furniture' && selectedFurniture) {
                        $(canvas).css('cursor', 'crosshair');
                    } else {
                        $(canvas).css('cursor', 'crosshair');
                    }
                }
            }

            function handleMouseUp(e) {
                const rect = canvas.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;

                if (isDrawing) {
                    // Finish drawing
                    isDrawing = false;

                    // Convert to world coordinates
                    const x1 = (startX - offsetX) / scale;
                    const y1 = (startY - offsetY) / scale;
                    const x2 = (x - offsetX) / scale;
                    const y2 = (y - offsetY) / scale;

                    // Create element based on current tool
                    switch (currentTool) {
                        case 'wall':
                            addWall(x1, y1, x2, y2);
                            break;

                        case 'door':
                            addDoor(x1, y1, x2, y2);
                            break;

                        case 'window':
                            addWindow(x1, y1, x2, y2);
                            break;

                        case 'room':
                            addRoom(
                                Math.min(x1, x2),
                                Math.min(y1, y2),
                                Math.abs(x2 - x1),
                                Math.abs(y2 - y1)
                            );
                            break;

                        case 'furniture':
                            if (selectedFurniture) {
                                addFurniture(
                                    (x - offsetX) / scale,
                                    (y - offsetY) / scale,
                                    selectedFurniture.type,
                                    selectedFurniture.width,
                                    selectedFurniture.depth
                                );
                            }
                            break;
                    }

                    drawCanvas();
                } else if (dragStart) {
                    // Stop panning
                    dragStart = null;
                    $(canvas).css('cursor', 'crosshair');
                }
            }

            function handleWheel(e) {
                e.preventDefault();

                // Zoom in/out based on wheel direction
                const zoomFactor = e.originalEvent.deltaY > 0 ? 0.8 : 1.2;
                zoom(zoomFactor, e.clientX, e.clientY);
            }

            function handleMouseLeave() {
                isDrawing = false;
                dragStart = null;
                drawCanvas();
            }

            function setTool(tool) {
                currentTool = tool;

                // Update active button
                $('.btn-control').removeClass('active').removeClass('btn-primary').addClass('btn-outline-primary');

                switch (tool) {
                    case 'wall':
                        $('#btnWall').removeClass('btn-outline-primary').addClass('btn-primary active');
                        break;
                    case 'door':
                        $('#btnDoor').removeClass('btn-outline-primary').addClass('btn-primary active');
                        break;
                    case 'window':
                        $('#btnWindow').removeClass('btn-outline-primary').addClass('btn-primary active');
                        break;
                    case 'room':
                        $('#btnRoom').removeClass('btn-outline-primary').addClass('btn-primary active');
                        break;
                    case 'furniture':
                        $('#btnFurniture').removeClass('btn-outline-primary').addClass('btn-primary active');
                        break;
                    case 'delete':
                        $('#btnDelete').removeClass('btn-outline-danger').addClass('btn-danger active');
                        break;
                }

                // Reset selected furniture unless furniture tool is active
                if (tool !== 'furniture') {
                    selectedFurniture = null;
                }

                drawCanvas();
            }

            function zoom(factor, centerX, centerY) {
                const rect = canvas.getBoundingClientRect();
                const worldX = ((centerX || canvas.width / 2) - rect.left - offsetX) / scale;
                const worldY = ((centerY || canvas.height / 2) - rect.top - offsetY) / scale;

                const newScale = scale * factor;

                // Limit zoom level
                if (newScale > 0.1 && newScale < 10) {
                    scale = newScale;

                    // Adjust offset to zoom toward mouse position
                    offsetX = (centerX || canvas.width / 2) - rect.left - worldX * scale;
                    offsetY = (centerY || canvas.height / 2) - rect.top - worldY * scale;

                    drawCanvas();

                    // Update scale indicator
                    scaleIndicator.text(`${Math.round(10 / scale * 10) / 10} ft`);
                }
            }

            function centerView() {
                offsetX = canvas.width / 2 - (scale * 20);
                offsetY = canvas.height / 2 - (scale * 15);
                drawCanvas();
            }

            function toggleGrid() {
                showGrid = !showGrid;
                $('#btnGrid').toggleClass('btn-primary');
                drawCanvas();
            }

            function addWall(x1, y1, x2, y2) {
                // Skip if the wall is too short
                if (Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2)) < 0.5) return;

                const wall = {
                    x1, y1, x2, y2,
                    thickness: wallThickness
                };

                saveToHistory();
                elements.walls.push(wall);
                updateRoomDimensions();
            }

            function addDoor(x1, y1, x2, y2) {
                // Ensure door is 3 feet long (standard door width)
                const length = Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
                const angle = Math.atan2(y2 - y1, x2 - x1);

                // Adjust end point to make exactly 3 feet
                const x2adj = x1 + Math.cos(angle) * 3;
                const y2adj = y1 + Math.sin(angle) * 3;

                const door = {
                    x1, y1,
                    x2: x2adj, y2: y2adj
                };

                saveToHistory();
                elements.doors.push(door);
            }

            function addWindow(x1, y1, x2, y2) {
                // Ensure window is at least 2 feet long
                const length = Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
                if (length < 2) return;

                const window = {
                    x1, y1, x2, y2
                };

                saveToHistory();
                elements.windows.push(window);
            }

            function addRoom(x, y, width, height) {
                // Skip if the room is too small
                if (width < 2 || height < 2) return;

                const room = {
                    x, y, width, height,
                    label: prompt('Enter room name (e.g., Living Room):') || 'Room'
                };

                saveToHistory();
                elements.rooms.push(room);
                updateRoomDimensions();
            }

            function addFurniture(x, y, type, width, depth) {
                const furniture = {
                    x, y, type, width, depth,
                    rotation: 0 // Can add rotation functionality later
                };

                saveToHistory();
                elements.furniture.push(furniture);
            }

            function deleteElementAt(x, y) {
                // Convert to world coordinates
                const worldX = (x - offsetX) / scale;
                const worldY = (y - offsetY) / scale;

                // Check furniture first (top layer)
                for (let i = elements.furniture.length - 1; i >= 0; i--) {
                    const item = elements.furniture[i];
                    if (isPointInFurniture(worldX, worldY, item)) {
                        saveToHistory();
                        elements.furniture.splice(i, 1);
                        drawCanvas();
                        return;
                    }
                }

                // Check doors and windows
                for (let i = elements.doors.length - 1; i >= 0; i--) {
                    const door = elements.doors[i];
                    if (isPointNearLine(worldX, worldY, door.x1, door.y1, door.x2, door.y2, 0.3)) {
                        saveToHistory();
                        elements.doors.splice(i, 1);
                        drawCanvas();
                        return;
                    }
                }

                for (let i = elements.windows.length - 1; i >= 0; i--) {
                    const window = elements.windows[i];
                    if (isPointNearLine(worldX, worldY, window.x1, window.y1, window.x2, window.y2, 0.3)) {
                        saveToHistory();
                        elements.windows.splice(i, 1);
                        drawCanvas();
                        return;
                    }
                }

                // Check walls
                for (let i = elements.walls.length - 1; i >= 0; i--) {
                    const wall = elements.walls[i];
                    if (isPointNearLine(worldX, worldY, wall.x1, wall.y1, wall.x2, wall.y2, wall.thickness / 24)) {
                        saveToHistory();
                        elements.walls.splice(i, 1);
                        updateRoomDimensions();
                        drawCanvas();
                        return;
                    }
                }

                // Check rooms
                for (let i = elements.rooms.length - 1; i >= 0; i--) {
                    const room = elements.rooms[i];
                    if (worldX >= room.x && worldX <= room.x + room.width &&
                        worldY >= room.y && worldY <= room.y + room.height) {
                        saveToHistory();
                        elements.rooms.splice(i, 1);
                        updateRoomDimensions();
                        drawCanvas();
                        return;
                    }
                }
            }

            function isPointNearLine(px, py, x1, y1, x2, y2, threshold) {
                // Calculate distance from point to line segment
                const A = px - x1;
                const B = py - y1;
                const C = x2 - x1;
                const D = y2 - y1;

                const dot = A * C + B * D;
                const len_sq = C * C + D * D;
                let param = -1;

                if (len_sq !== 0) {
                    param = dot / len_sq;
                }

                let xx, yy;

                if (param < 0) {
                    xx = x1;
                    yy = y1;
                } else if (param > 1) {
                    xx = x2;
                    yy = y2;
                } else {
                    xx = x1 + param * C;
                    yy = y1 + param * D;
                }

                const dx = px - xx;
                const dy = py - yy;

                return Math.sqrt(dx * dx + dy * dy) < threshold;
            }

            function isPointInFurniture(px, py, furniture) {
                // Simple rectangle collision for now (can add rotation later)
                return px >= furniture.x - furniture.width / 2 &&
                    px <= furniture.x + furniture.width / 2 &&
                    py >= furniture.y - furniture.depth / 2 &&
                    py <= furniture.y + furniture.depth / 2;
            }

            function saveToHistory() {
                // Save current state to history
                history.push(JSON.parse(JSON.stringify(elements)));

                // Limit history size
                if (history.length > MAX_HISTORY) {
                    history.shift();
                }
            }

            function undoAction() {
                if (history.length > 0) {
                    elements = history.pop();
                    updateRoomDimensions();
                    drawCanvas();
                }
            }

            function clearCanvas() {
                if (confirm('Are you sure you want to clear the entire floor plan?')) {
                    saveToHistory();
                    elements = {
                        walls: [],
                        doors: [],
                        windows: [],
                        rooms: [],
                        furniture: []
                    };
                    updateRoomDimensions();
                    drawCanvas();
                }
            }

            function saveDesign() {
                const designName = prompt('Enter a name for your design:');
                if (designName) {
                    // In a real implementation, you would save to server or localStorage
                    const design = {
                        name: designName,
                        date: new Date().toISOString(),
                        elements: elements
                    };

                    // For now, just show a message
                    alert(`Design "${designName}" saved! (In a real app, this would be saved to your account)`);
                }
            }

            function updateRoomDimensions() {
                // Clear current dimensions
                roomDimensions.empty();

                // Calculate and display room areas
                elements.rooms.forEach(room => {
                    const area = room.width * room.height;
                    const dimension = $('<div>').addClass('room-dimension').html(`<span>${room.label}</span><span>${room.width.toFixed(1)} ft × ${room.height.toFixed(1)} ft (${area.toFixed(1)} sq.ft)</span>`);
                    roomDimensions.append(dimension);
                });

                // Show empty state if no rooms
                if (elements.rooms.length === 0) {
                    roomDimensions.html(`
                    <div class="empty-state">
                        <i class="bi bi-pencil-square" style="font-size: 2rem;"></i>
                        <p class="mt-2">Start drawing to see room measurements</p>
                    </div>
                `);
                }
            }

            function exportAsImage() {
                // Create a temporary canvas with higher resolution
                const tempCanvas = document.createElement('canvas');
                const tempCtx = tempCanvas.getContext('2d');

                // Calculate canvas bounds that contain all elements
                let minX = Infinity, minY = Infinity, maxX = -Infinity, maxY = -Infinity;

                // Check all walls
                elements.walls.forEach(wall => {
                    minX = Math.min(minX, wall.x1, wall.x2);
                    minY = Math.min(minY, wall.y1, wall.y2);
                    maxX = Math.max(maxX, wall.x1, wall.x2);
                    maxY = Math.max(maxY, wall.y1, wall.y2);
                });

                // Check all rooms
                elements.rooms.forEach(room => {
                    minX = Math.min(minX, room.x);
                    minY = Math.min(minY, room.y);
                    maxX = Math.max(maxX, room.x + room.width);
                    maxY = Math.max(maxY, room.y + room.height);
                });

                // Check all furniture
                elements.furniture.forEach(item => {
                    minX = Math.min(minX, item.x - item.width / 2);
                    minY = Math.min(minY, item.y - item.depth / 2);
                    maxX = Math.max(maxX, item.x + item.width / 2);
                    maxY = Math.max(maxY, item.y + item.depth / 2);
                });

                // Check all doors and windows
                elements.doors.forEach(door => {
                    minX = Math.min(minX, door.x1, door.x2);
                    minY = Math.min(minY, door.y1, door.y2);
                    maxX = Math.max(maxX, door.x1, door.x2);
                    maxY = Math.max(maxY, door.y1, door.y2);
                });

                elements.windows.forEach(window => {
                    minX = Math.min(minX, window.x1, window.x2);
                    minY = Math.min(minY, window.y1, window.y2);
                    maxX = Math.max(maxX, window.x1, window.x2);
                    maxY = Math.max(maxY, window.y1, window.y2);
                });

                // Add some padding
                minX -= 5;
                minY -= 5;
                maxX += 5;
                maxY += 5;

                // Set temporary canvas size
                const width = maxX - minX;
                const height = maxY - minY;
                const exportScale = 10; // Higher resolution

                tempCanvas.width = width * exportScale;
                tempCanvas.height = height * exportScale;

                // Draw all elements to temporary canvas
                tempCtx.save();
                tempCtx.scale(exportScale, exportScale);
                tempCtx.translate(-minX, -minY);

                // Draw background
                tempCtx.fillStyle = 'white';
                tempCtx.fillRect(minX, minY, width, height);

                // Draw grid
                if (showGrid) {
                    tempCtx.strokeStyle = '#e0e0e0';
                    tempCtx.lineWidth = 1 / exportScale;

                    const gridSize = 1; // 1 foot grid

                    // Vertical lines
                    for (let x = Math.floor(minX); x <= maxX; x += gridSize) {
                        tempCtx.beginPath();
                        tempCtx.moveTo(x, minY);
                        tempCtx.lineTo(x, maxY);
                        tempCtx.stroke();
                    }

                    // Horizontal lines
                    for (let y = Math.floor(minY); y <= maxY; y += gridSize) {
                        tempCtx.beginPath();
                        tempCtx.moveTo(minX, y);
                        tempCtx.lineTo(maxX, y);
                        tempCtx.stroke();
                    }

                    // Draw major grid lines (every 5 feet)
                    tempCtx.strokeStyle = '#bdbdbd';
                    tempCtx.lineWidth = 1.5 / exportScale;

                    // Vertical major lines
                    for (let x = Math.floor(minX / 5) * 5; x <= maxX; x += 5) {
                        tempCtx.beginPath();
                        tempCtx.moveTo(x, minY);
                        tempCtx.lineTo(x, maxY);
                        tempCtx.stroke();
                    }

                    // Horizontal major lines
                    for (let y = Math.floor(minY / 5) * 5; y <= maxY; y += 5) {
                        tempCtx.beginPath();
                        tempCtx.moveTo(minX, y);
                        tempCtx.lineTo(maxX, y);
                        tempCtx.stroke();
                    }
                }

                // Draw all rooms first (background)
                elements.rooms.forEach(room => {
                    tempCtx.fillStyle = 'rgba(100, 149, 237, 0.1)';
                    tempCtx.strokeStyle = 'rgba(100, 149, 237, 0.8)';
                    tempCtx.lineWidth = 2 / exportScale;

                    tempCtx.beginPath();
                    tempCtx.rect(room.x, room.y, room.width, room.height);
                    tempCtx.fill();
                    tempCtx.stroke();

                    // Room label
                    if (room.width > 5 && room.height > 3) {
                        tempCtx.fillStyle = 'rgba(100, 149, 237, 0.7)';
                        tempCtx.font = `${Math.min(room.width / 3, 1.4)}px Arial`;
                        tempCtx.textAlign = 'center';
                        tempCtx.textBaseline = 'middle';
                        tempCtx.fillText(
                            room.label || 'Room',
                            room.x + room.width / 2,
                            room.y + room.height / 2
                        );
                    }
                });

                // Then walls
                elements.walls.forEach(wall => {
                    tempCtx.lineWidth = wall.thickness / 12;
                    tempCtx.strokeStyle = '#333';
                    tempCtx.lineCap = 'round';

                    tempCtx.beginPath();
                    tempCtx.moveTo(wall.x1, wall.y1);
                    tempCtx.lineTo(wall.x2, wall.y2);
                    tempCtx.stroke();
                });

                // Then doors and windows
                elements.doors.forEach(door => {
                    const length = Math.sqrt(Math.pow(door.x2 - door.x1, 2) + Math.pow(door.y2 - door.y1, 2));
                    const angle = Math.atan2(door.y2 - door.y1, door.x2 - door.x1);

                    tempCtx.save();
                    tempCtx.translate(door.x1, door.y1);
                    tempCtx.rotate(angle);

                    // Door frame
                    tempCtx.strokeStyle = '#8B4513';
                    tempCtx.lineWidth = 4 / exportScale;
                    tempCtx.beginPath();
                    tempCtx.moveTo(0, 0);
                    tempCtx.lineTo(length, 0);
                    tempCtx.stroke();

                    // Door
                    tempCtx.fillStyle = '#CD853F';
                    tempCtx.beginPath();
                    tempCtx.arc(length - 0.3, 0, 0.3, 0, Math.PI * 2);
                    tempCtx.fill();

                    tempCtx.restore();
                });

                elements.windows.forEach(window => {
                    const length = Math.sqrt(Math.pow(window.x2 - window.x1, 2) + Math.pow(window.y2 - window.y1, 2));
                    const angle = Math.atan2(window.y2 - window.y1, window.x2 - window.x1);

                    tempCtx.save();
                    tempCtx.translate(window.x1, window.y1);
                    tempCtx.rotate(angle);

                    // Window frame
                    tempCtx.strokeStyle = '#4682B4';
                    tempCtx.lineWidth = 6 / exportScale;
                    tempCtx.beginPath();
                    tempCtx.moveTo(0, 0);
                    tempCtx.lineTo(length, 0);
                    tempCtx.stroke();

                    // Window panes
                    tempCtx.strokeStyle = '#E6F3FA';
                    tempCtx.lineWidth = 1 / exportScale;
                    const paneCount = Math.floor(length / 2);

                    for (let i = 1; i <= paneCount; i++) {
                        const x = (length / (paneCount + 1)) * i;
                        tempCtx.beginPath();
                        tempCtx.moveTo(x, -0.3);
                        tempCtx.lineTo(x, 0.3);
                        tempCtx.stroke();
                    }

                    tempCtx.restore();
                });

                // Finally furniture (top layer)
                elements.furniture.forEach(item => {
                    tempCtx.save();
                    tempCtx.translate(item.x, item.y);

                    // Furniture color based on type
                    let color = '#8d6e63'; // Default brown

                    switch (item.type) {
                        case 'sofa':
                        case 'armchair':
                            color = '#795548';
                            break;
                        case 'coffee-table':
                        case 'tv-stand':
                            color = '#6d4c41';
                            break;
                        case 'bed':
                        case 'wardrobe':
                        case 'nightstand':
                        case 'dresser':
                            color = '#5e35b1';
                            break;
                        case 'refrigerator':
                        case 'kitchen-cabinet':
                        case 'stove':
                            color = '#303f9f';
                            break;
                        case 'toilet':
                        case 'sink':
                        case 'bathtub':
                        case 'shower':
                            color = '#00796b';
                            break;
                    }

                    tempCtx.fillStyle = color;
                    tempCtx.strokeStyle = '#333';
                    tempCtx.lineWidth = 1 / exportScale;

                    // Draw different shapes based on furniture type
                    switch (item.type) {
                        case 'sofa':
                            drawRoundedRectangle(tempCtx, -item.width / 2, -item.depth / 2, item.width, item.depth, 0.5);
                            break;
                        case 'dining-table':
                            tempCtx.beginPath();
                            tempCtx.ellipse(0, 0, item.width / 2, item.depth / 2, 0, 0, Math.PI * 2);
                            tempCtx.fill();
                            tempCtx.stroke();
                            break;
                        case 'toilet':
                            tempCtx.beginPath();
                            tempCtx.ellipse(0, item.depth / 4, item.width / 2, item.depth / 2, 0, 0, Math.PI);
                            tempCtx.fill();
                            tempCtx.stroke();
                            break;
                        default:
                            tempCtx.beginPath();
                            tempCtx.rect(-item.width / 2, -item.depth / 2, item.width, item.depth);
                            tempCtx.fill();
                            tempCtx.stroke();
                    }

                    tempCtx.restore();
                });

                tempCtx.restore();

                // Add title and scale
                tempCtx.fillStyle = 'black';
                tempCtx.font = `${20}px Arial`;
                tempCtx.textAlign = 'left';
                tempCtx.fillText('Floor Plan', 20, 30);

                tempCtx.font = `${14}px Arial`;
                tempCtx.fillText(`Scale: 1 foot = ${exportScale} pixels`, 20, 50);

                // Add footer with company info
                tempCtx.font = `${12}px Arial`;
                tempCtx.textAlign = 'right';
                tempCtx.fillText('Created with VillageConstruct Floor Planner', tempCanvas.width - 20, tempCanvas.height - 20);
                tempCtx.fillText(new Date().toLocaleDateString(), tempCanvas.width - 20, tempCanvas.height - 40);

                // Convert to image and download
                const dataURL = tempCanvas.toDataURL('image/png');
                const link = document.createElement('a');
                link.download = 'floor-plan.png';
                link.href = dataURL;
                link.click();
            }

            function exportAsPDF() {
                alert('PDF export would be implemented here. In a real application, this would generate a PDF document of your floor plan.');
            }

            function printPlan() {
                alert('Print functionality would be implemented here. For now, use the image export and print that.');
            }

            // Initialize with wall tool
            setTool('wall');

            // Set initial scale (1 foot = 20 pixels)
            scale = 20;
            scaleIndicator.text('10 ft');

            // Center view
            centerView();
        });
    </script>
</main>

</asp:Content>
