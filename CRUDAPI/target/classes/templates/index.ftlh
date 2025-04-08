<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link 
        rel="stylesheet" 
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    >
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom, #4ad9e4, #1c1e29);
            font-family: 'Segoe UI', sans-serif;
            color: #fff;
        }

        .full-page-wrapper {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
            padding: 20px;
        }

        .hero-section {
            background-color: rgba(0, 0, 0, 0.35);
            border-radius: 20px;
            padding: 60px 50px;
            text-align: center;
            max-width: 700px;
            width: 100%;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(10px);
        }

        .hero-section h1 {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 25px;
            color: #ffffff;
        }

        .hero-section p {
            font-size: 1.3rem;
            opacity: 0.9;
            margin-bottom: 40px;
        }

        .btn-group a {
            padding: 18px 40px;
            font-size: 1.25rem;
            font-weight: bold;
            margin: 0 15px;
            border-radius: 40px;
            transition: all 0.2s ease;
        }

        .btn-group a:hover {
            transform: scale(1.08);
            opacity: 0.95;
        }

        .btn-view {
            background-color: #ffffff;
            color: #1c1e29;
            border: none;
        }

        .btn-add {
            background-color: #4ad9e4;
            color: #000;
            border: none;
        }
    </style>
</head>
<body>
<div class="full-page-wrapper">
    <div class="hero-section">
        <h1>${title}</h1>

        <div class="btn-group">
            <a href="/animals/all" class="btn btn-view">🐾 View Animals</a>
            <a href="/animals/createForm" class="btn btn-add">➕ Add New Animal</a>
        </div>
    </div>
</div>
</body>
</html>
