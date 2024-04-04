<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        *{
            box-sizing: border-box;
        }
        #wrapper{
            width: 1200px;
            margin: 10px auto;    
        }
        .login-top {
            background: #704DE4;
            width: 400px;
            height: 65px;
            border-radius: 20px;
            margin: auto;
            margin-top: 100px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 20px;
        }
        .login-top h2 {
            color: #FFFFFF;
            text-align: center
        }
        .top-area{
            border-bottom: 2px solid #704DE4;
            font-size: 30px;
            height: 45px;
            font: bold;
        }
        li {
            font-size: 20px;
        }
        .select-area{
            margin-left: 10%;
        }
        .select-area label{
            font-size: 25px;
        }
        .buttons{
            display: flex;
            justify-content: center;
            gap: 20px;
        }
        
    </style>
</head>
<body>
    <div id="wrapper">
        <div class="login-top">
            <h2>시설물 등록</h2>
        </div>
        
        <br>

        <div class="top-area"><p>공간 유형을 선택해주세요.</p></div>
        
        <br><br><br>
        <ul>
            <li>공간 유형을 선택해주세요.</li>
            <li>선택한 공간 용도 안에서, 등록한 공간에 적합한 유형은 모두 선택이 가능합니다.</li>
            <li>검수 단계에서 검수 기준에 적합하지 않는 유형은 제외될 수 있습니다.</li>
            <li>검수 신청 후, 공간 유형은 고객센터를 통해서만 가능하오니, 신중히 선택해주세요!</li>
        </ul>
        <br><br><br>
        <form action="">
            <table class="select-area">
                <tr>
                    <td> <input type="checkbox" id="party" name="">
                        <label for="party">파티룸</label>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td><p>최소 2인 이상 수용가능한 독립적인 공간으로 파티가 가능한 공간</p></td>
                </tr>
                <tr>
                    <td> <input type="checkbox" id="cafe" name="">
                        <label for="cafe">카페</label>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td><p>카페 전체를 대관하여 모임에 독립적으로 제공이 가능한 공간</p></td>
                </tr>
                <tr>
                    <td> <input type="checkbox" id="lecture " name="">
                        <label for="lecture ">강의실</label>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td><p>학습 및 교육 목적으로 강의, 수업, 세미나로 활용할 수 있는 공간</p></td>
                </tr>
                <tr>
                    <td> <input type="checkbox" id="meeting" name="">
                        <label for="meeting">회의실</label>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td><p>비지니스 목적으로 진행되는 회의, 워크숍 관련한 시설이 제공되는 공간</p></td>
                </tr>
                <tr>
                    <td> <input type="checkbox" id="seminar" name="">
                        <label for="seminar">세미나실</label>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td><p>여럿이 함께 토론, 발표, 강연, 워크숍, 연수 등을 진행할 수 있는 시설이 제공되는 공간</p></td>
                </tr>
                <tr>
                    <td> <input type="checkbox" id="study" name="">
                        <label for="study">스터디룸</label>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <p>스터디, 팀플, 공모전, 독서 등 학습 활동에 필요한 시설이 구비되어 <br>
                            '스터디 공간'으로 가능할 수 있는 공간
                    </td>
                </tr>
            </table>
            <br><br>
            <div class="buttons">
                <button>이전</button>
                <button type="submit">다음</button>
            </div>
        </form>
    </div>
    <table class="detail-area">
        <tr>

        </tr>
    </table>
</body>
</html>