<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>팜스토리 | 페이지를 찾을 수 없습니다</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Noto Sans KR', sans-serif; background-color: #f4fcf7; }
        .poppins { font-family: 'Poppins', sans-serif; }
        @keyframes sway { 0%, 100% { transform: rotate(-3deg) scale(1); } 50% { transform: rotate(3deg) scale(1.05); } }
        @keyframes float { 0%, 100% { transform: translateY(0); } 50% { transform: translateY(-8px); } }
        .animate-sway { animation: sway 3s ease-in-out infinite; }
        .animate-float { animation: float 4s ease-in-out infinite; }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-4 md:p-6 relative overflow-hidden">

    <div class="absolute -top-32 -left-32 w-96 h-96 bg-green-100 rounded-full blur-3xl opacity-60 pointer-events-none"></div>
    <div class="absolute -bottom-32 -right-32 w-96 h-96 bg-emerald-100 rounded-full blur-3xl opacity-60 pointer-events-none"></div>

    <div class="max-w-xl w-full bg-white rounded-3xl shadow-xl border border-green-50 p-8 md:p-12 text-center relative z-10 transition-all duration-300 hover:shadow-2xl">
        
        <div class="flex items-center justify-center gap-2 mb-6">
            <span class="text-3xl text-emerald-600"><i class="fa-solid fa-seedling"></i></span>
            <span class="poppins text-2xl font-bold tracking-wider text-slate-800">Farm<span class="text-emerald-600">Story</span></span>
        </div>

        <div class="relative w-48 h-48 mx-auto mb-8 flex items-center justify-center">
            <div class="absolute inset-0 bg-emerald-50 rounded-full scale-90 animate-pulse"></div>
            <div class="absolute top-4 right-2 text-4xl text-slate-400 animate-float">
                <i class="fa-solid fa-magnifying-glass"></i>
            </div>
            <div class="animate-sway text-7xl text-slate-300 mt-6 relative z-10">
                <i class="fa-solid fa-map-location-dot"></i>
            </div>
        </div>

        <h1 class="text-2xl md:text-3xl font-bold text-slate-800 tracking-tight mb-4">
            원하시는 <span class="text-emerald-600">페이지를 찾을 수 없습니다.</span>
        </h1>
        
        <p class="text-slate-500 text-base md:text-lg mb-8 leading-relaxed">
            방문하시려는 페이지의 주소가 잘못 입력되었거나,<br>
            페이지가 변경 혹은 삭제되어 현재 찾을 수 없습니다. (404 Not Found)
        </p>

        <a href="<%= request.getContextPath() %>/index.do" class="inline-block bg-emerald-500 hover:bg-emerald-600 text-white font-medium py-3 px-8 rounded-full transition-colors duration-200 mb-8">
            <i class="fa-solid fa-house mr-2"></i> 메인으로 돌아가기
        </a>

        <div class="text-xs text-slate-400">
            <p class="mb-2">관련 문의사항은 고객센터 메일로 연락해 주시면 빠르게 답변해 드리겠습니다.</p>
            <p class="font-medium text-slate-500 mb-6">Email: support@farmstory.com</p>
            <hr class="border-slate-100 my-4">
            <p class="poppins">© 2026 FarmStory. All rights reserved.</p>
        </div>
    </div>
</body>
</html>