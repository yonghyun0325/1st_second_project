<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    .btn-open-help {
        position: fixed;
        bottom: 1em;
        right: 1em;
        width: 70px;
        height: 70px;
        border-radius: 40px; 
        margin: 0;
        border: none; 
        cursor: pointer; 
        background-color: var(--funfun-blue);
        opacity: 0.7;
        transition: all 0.4s ease; 
        display: flex; 
        justify-content: center; 
        align-items: center; 
        overflow: hidden;
        z-index: 9999;
    }

    .btn-open-help i {
        color: var(--funfun-white);
        font-size: 35px;
    }

    .btn-open-help:hover {
        opacity: 1;
        background-color: var(--funfun-blue-dark); 
    }

    .btn-open-help.expanded {
        width: 400px;
        height: 680px;
        color:white;
        background: var(--funfun-blue-dark);
        border-radius: 20px;
        flex-direction: column;
        align-items: flex-start;
        justify-content: flex-start;
        padding: 20px;
        overflow: hidden;
        opacity: 1;
        cursor: default;
        box-shadow: 0 4px 30px rgba(0, 0, 0, 0.2);
    }

    .btn-open-help.expanded .btn-open-help-icon  {
        display: none;
    }

    .help-content {
        display: none;
        position: relative;
        opacity: 0;
        transition: opacity 0.4s ease;
        height:100%;
    }

    .btn-open-help.expanded .help-content {
        display: block;
        opacity: 1;
    }

    .help-header {
        display: flex;
        width: 100%;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 20px;
    }

    .help-header-title {
        display: flex;
        gap: 15px;
        align-items: center;
        color: #fff;
    }

    .help-close {
        color: #fff;
        font-size: 28px;
        font-weight: bold;
        cursor: pointer;
    }

    .help-content select {
        margin: 5px 0 15px 0;
        padding: 8px;
        width: 100%;
        background: #fff; 
        border-radius: 10px;
        border: none;
    }

    .help-content textarea {
        width: 100%; 
        height: 300px; 
        padding: 10px; 
        box-sizing: border-box; 
        margin: 5px 0 15px 0;
        border-radius: 10px;
        border: none;
        background: #fff; 
        font-size: 16px; 
        line-height: 1.5; 
        overflow-y: auto; 
        resize: none;
    }

    .help-footer {
        display: flex;
        width: 100%;
        justify-content: right;
        align-items: center;
    }

    .help-content input[type="submit"] {
        margin: 0;
        background: white;
        color: black;
    }

    .help-content input[type="submit"]:hover {
        background: #ddd;
    }

    .success-message-background {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 80%;
        max-width: 300px;
        padding: 20px 30px;
        background: rgba(0, 0, 0, 0.2);
        border-radius: 10px;
        z-index: 10;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .success-message {
        color: green;
        font-size: 16px;
        text-align: center;
    }

</style>

<div>
    <div class="btn-open-help">
        <div class="btn-open-help-icon">
            <i class="fas fa-user-headset"></i>
        </div>

        <div class="help-content">
            <div class="help-header">
                <div class="help-header-title">
                    <i class="fas fa-user-headset"></i>
                    <h2>문의하기</h2>
                </div>
                <span class="help-close">&times;</span>
            </div>
            <form id="inquiryForm" method="POST" action="/help/insertHelp">
                <label for="product">문의가 필요한 부분을 선택해주십시오.</label>
                <select id="product" name="product" required>
                    <option value="">목록을 선택해주십시오.</option>
                    <option value="finance">재무업무</option>
                    <option value="purchase">구매업무</option>
                    <option value="hr">인사업무</option>
                    <option value="board">게시판</option>
                    <option value="etc">기타 문의</option>
                </select>

                <label for="service">어떤 지원 서비스가 필요합니까?</label>
                <select id="service" name="service" required>
                    <option value="">상위 목록을 선택해주십시오.</option>
                </select>

                <label for="help_detail">문의 내용</label>
                <textarea class="help_detail" id="help_detail" name="help_detail" required></textarea>

                <div class="help-footer">
                    <input type="submit" value="제출하기">
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        const $btnOpenModal = $('.btn-open-help');
        const $modalContent = $('.help-content');

        const $inquiryForm = $('#inquiryForm');
        const $productSelect = $('#product');
        const $serviceSelect = $('#service');
        const $helpDetail = $('#help_detail');

        $btnOpenModal.on("click", function (event) {
            if ($btnOpenModal.hasClass('expanded') && !$(event.target).closest('.help-close').length) {
                return;
            }
            event.stopPropagation();
            $btnOpenModal.toggleClass('expanded');
            
            if ($btnOpenModal.hasClass('expanded')) {
                $btnOpenModal.on("transitionend", function () {
                    $modalContent.css('opacity', '1');
                    $btnOpenModal.off("transitionend");
                });
            } else {
                $modalContent.css('opacity', '0');
            }
        });

        $(document).on("click", ".help-close", function (event) {
            event.stopPropagation();
            $inquiryForm[0].reset();
            $btnOpenModal.removeClass('expanded');
            $modalContent.css('opacity', '0');
        });
        
        const isLoginPage = $('body').hasClass('login-page');

        if (isLoginPage) {
            $productSelect.empty().append(`
                <option value="">목록을 선택해주십시오.</option>
                <option value="hr">인사업무</option>
                <option value="etc">기타 문의</option>
            `);
            $inquiryForm.append(`
                <input type="hidden" id="help-e_idx" name="e_idx" value="20000000">`)
        }

        const serviceOptions = {
            "finance": [
                { value: "재무서비스1", text: "급여 관리" },
                { value: "재무서비스2", text: "재무 분석" }
            ],
            "purchase": [
                { value: "구매서비스1", text: "구매 주문" },
                { value: "구매서비스2", text: "재고 관리" }
            ],
            "hr": isLoginPage ? [
                { value: "사원번호 분실", text: "사원번호 분실" },
                { value: "비밀번호 분실", text: "비밀번호 분실" },
                { value: "등록 오류", text: "등록 오류" }
            ] : [
                { value: "인사서비스1", text: "인사 정보" },
                { value: "인사서비스2", text: "채용 관리" }
            ],
            "board": [
                { value: "게시판서비스1", text: "공지사항" },
                { value: "게시판서비스2", text: "커뮤니티" },
                { value: "게시판서비스3", text: "분실물 신고" }
            ],
            "etc": isLoginPage ? [
                { value: "접속문제", text: "접속문제" },
                { value: "원격지원", text: "원격지원" },
                { value: "일반문의", text: "일반문의" }
            ] : [
                { value: "기타서비스1", text: "홈페이지 접속문제" },
                { value: "기타서비스2", text: "원격지원" },
                { value: "기타서비스3", text: "기타 일반문의" }
            ]
        };

        $productSelect.on('change', function () {
            const selectedProduct = $(this).val();
            $serviceSelect.empty().append('<option value="">지원 목록을 선택하십시오.</option>');

            if (serviceOptions[selectedProduct]) {
                $.each(serviceOptions[selectedProduct], function (index, service) {
                    const $option = $('<option>').val(service.value).text(service.text);
                    $serviceSelect.append($option);
                });
            }
        });

        
        const $successMessageBackground = $('<div class="success-message-background" style="display: none;"></div>');
        const $successMessage = $('<div class="success-message"></div>');
        $successMessageBackground.append($successMessage);
        $modalContent.append($successMessageBackground);

        $inquiryForm.on('submit', function (event) {
            event.preventDefault();

            const formData = {
                product: $('#product').val(),
                service: $('#service').val(),
                help_detail: $('#help_detail').val()
            };

            $.ajax({
                type: 'POST',
                url: '/help/insertHelp.do',
                data: formData,
                dataType: 'json',
                success: function (response) {
                    if (response.status === 'success') {
                        $successMessage.text(response.message);
                        $successMessageBackground.fadeIn().delay(3000).fadeOut();
                        $inquiryForm[0].reset();
                    } else {
                        $successMessage.text(response.message).css('color', 'red');
                        $successMessageBackground.fadeIn().delay(3000).fadeOut();
                    }
                },
                error: function (jqXHR) {
                    $successMessage.html('서버 오류가 발생했습니다.<br>다시 시도해주세요.').css('color', 'red');
                    $successMessageBackground.fadeIn().delay(3000).fadeOut();
                }
            });
        });
    });
</script>