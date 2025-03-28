<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculator</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            /* 将这里的 URL 替换为你的图片网址 */
            background-image: url('https://cn.bing.com/images/search?view=detailV2&ccid=eYtq6A6M&id=C4A53CBCF6E9DEA282DCDBFB056200879CAE7EED&thid=OIP.eYtq6A6MY96w04RnRcXiOQHaEK&mediaurl=https%3a%2f%2ffile.moyublog.com%2ffree_wallpapers_files%2fdjfhxk3drai.jpg&exph=1080&expw=1920&q=%e8%b5%9b%e5%8d%9a%e6%9c%8b%e5%85%8b%e5%a3%81%e7%ba%b8&simid=608048494059857327&FORM=IRPRST&ck=208E43D1919BB27BBD39958A611F3DFB&selectedIndex=31&itb=0'); 
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        table {
            border-collapse: collapse;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            overflow: hidden;
            border: 2px solid #ccc;
            background: linear-gradient(135deg, #e0e0e0, #f0f0f0);
        }

        td {
            padding: 0;
            border: 1px solid #ccc;
        }

        input[type="text"] {
            width: 100%;
            padding: 20px;
            box-sizing: border-box;
            font-size: 24px;
            text-align: right;
            border: none;
            background-color: #e0e0e0;
            color: #333;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 1px;
        }

        button {
            width: 100%;
            padding: 20px;
            font-size: 20px;
            border: none;
            background-color: #fff;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        button:hover {
            background-color: #d0d0d0;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2), 0 0 10px 5px rgba(255, 165, 0, 0.7);
        }

        button:active {
            transform: translateY(1px);
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        button.operator {
            background: linear-gradient(135deg, #f5923e, #e4822d);
            color: white;
        }

        button.operator:hover {
            background: linear-gradient(135deg, #e4822d, #d3721c);
        }

        button.clear {
            background: linear-gradient(135deg, #ff6b6b, #e55a5a);
            color: white;
        }

        button.clear:hover {
            background: linear-gradient(135deg, #e55a5a, #d44949);
        }

        @keyframes shake {
            0% {
                transform: translate(1px, 1px) rotate(0deg);
            }
            10% {
                transform: translate(-1px, -2px) rotate(-1deg);
            }
            20% {
                transform: translate(-3px, 0px) rotate(1deg);
            }
            30% {
                transform: translate(3px, 2px) rotate(0deg);
            }
            40% {
                transform: translate(1px, -1px) rotate(1deg);
            }
            50% {
                transform: translate(-1px, 2px) rotate(-1deg);
            }
            60% {
                transform: translate(-3px, 1px) rotate(0deg);
            }
            70% {
                transform: translate(3px, 1px) rotate(-1deg);
            }
            80% {
                transform: translate(-1px, -1px) rotate(1deg);
            }
            90% {
                transform: translate(1px, 2px) rotate(0deg);
            }
            100% {
                transform: translate(1px, -2px) rotate(-1deg);
            }
        }

        .shake {
            animation: shake 0.5s;
            animation-iteration-count: 1;
        }

        #particles-js {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: -1;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js"></script>
</head>

<body>
    <div id="particles-js"></div>
    <table>
        <tr>
            <td colspan="4">
                <input type="text" id="result" readonly>
            </td>
        </tr>
        <tr>
            <td><button onclick="appendToResult('7'); this.classList.add('shake'); setTimeout(() => this.classList.remove('shake'), 500); triggerParticles(event);">7</button></td>
            <td><button onclick="appendToResult('8'); this.classList.add('shake'); setTimeout(() => this.classList.remove('shake'), 500); triggerParticles(event);">8</button></td>
            <td><button onclick="appendToResult('9'); this.classList.add('shake'); setTimeout(() => this.classList.remove('shake'), 500); triggerParticles(event);">9</button></td>
            <td><button onclick="appendToResult('/'); this.classList.add('shake'); setTimeout(() => this.classList.remove('shake'), 500); triggerParticles(event);" class="operator">/</button></td>
        </tr>
        <tr>
            <td><button onclick="appendToResult('4'); this.classList.add('shake'); setTimeout(() => this.classList.remove('shake'), 500); triggerParticles(event);">4</button></td>
            <td><button onclick="appendToResult('5'); this.classList.add('shake'); setTimeout(() => this.classList.remove('shake'), 500); triggerParticles(event);">5</button></td>
            <td><button onclick="appendToResult('6'); this.classList.add('shake'); setTimeout(() => this.classList.remove('shake'), 500); triggerParticles(event);">6</button></td>
            <td><button onclick="appendToResult('*'); this.classList.add('shake'); setTimeout(() => this.classList.remove('shake'), 500); triggerParticles(event);" class="operator">*</button></td>
        </tr>
        <tr>
            <td><button onclick="appendToResult('1'); this.classList.add('shake'); setTimeout(() => this.classList.remove('shake'), 500); triggerParticles(event);">1</button></td>
            <td><button onclick="appendToResult('2'); this.classList.add('shake'); setTimeout(() => this.classList.remove('shake'), 500); triggerParticles(event);">2</button></td>
            <td><button onclick="appendToResult('3'); this.classList.add('shake'); setTimeout(() => this.classList.remove('shake'), 500); triggerParticles(event);">3</button></td>
            <td><button onclick="appendToResult('-'); this.classList.add('shake'); setTimeout(() => this.classList.remove('shake'), 500); triggerParticles(event);" class="operator">-</button></td>
        </tr>
        <tr>
            <td><button onclick="appendToResult('0'); this.classList.add('shake'); setTimeout(() => this.classList.remove('shake'), 500); triggerParticles(event);">0</button></td>
            <td><button onclick="appendToResult('.'); this.classList.add('shake'); setTimeout(() => this.classList.remove('shake'), 500); triggerParticles(event);">.</button></td>
            <td><button onclick="calculate(); this.classList.add('shake'); setTimeout(() => this.classList.remove('shake'), 500); triggerParticles(event);" class="operator">=</button></td>
            <td><button onclick="appendToResult('+'); this.classList.add('shake'); setTimeout(() => this.classList.remove('shake'), 500); triggerParticles(event);" class="operator">+</button></td>
        </tr>
        <tr>
            <td colspan="4">
                <button onclick="clearResult(); this.classList.add('shake'); setTimeout(() => this.classList.remove('shake'), 500); triggerParticles(event);" class="clear">Clear</button>
            </td>
        </tr>
    </table>

    <script>
        function appendToResult(value) {
            document.getElementById('result').value += value;
        }

        function clearResult() {
            document.getElementById('result').value = '';
        }

        function calculate() {
            try {
                document.getElementById('result').value = eval(document.getElementById('result').value);
            } catch (error) {
                document.getElementById('result').value = 'Error';
            }
        }

        function triggerParticles(event) {
            const clickX = event.clientX;
            const clickY = event.clientY;
            particlesJS.load('particles-js', {
                "particles": {
                    "number": {
                        "value": 30,
                        "density": {
                            "enable": true,
                            "value_area": 800
                        }
                    },
                    "color": {
                        "value": "#ff0000"
                    },
                    "shape": {
                        "type": "circle",
                        "stroke": {
                            "width": 0,
                            "color": "#000000"
                        },
                        "polygon": {
                            "nb_sides": 5
                        },
                        "image": {
                            "src": "img/github.svg",
                            "width": 100,
                            "height": 100
                        }
                    },
                    "opacity": {
                        "value": 0.8,
                        "random": false,
                        "anim": {
                            "enable": false,
                            "speed": 1,
                            "opacity_min": 0.1,
                            "sync": false
                        }
                    },
                    "size": {
                        "value": 3,
                        "random": true,
                        "anim": {
                            "enable": false,
                            "speed": 40,
                            "size_min": 0.1,
                            "sync": false
                        }
                    },
                    "line_linked": {
                        "enable": false
                    },
                    "move": {
                        "enable": true,
                        "speed": 6,
                        "direction": "none",
                        "random": true,
                        "straight": false,
                        "out_mode": "out",
                        "bounce": false,
                        "attract": {
                            "enable": false,
                            "rotateX": 600,
                            "rotateY": 1200
                        }
                    }
                },
                "interactivity": {
                    "detect_on": "canvas",
                    "events": {
                        "onhover": {
                            "enable": false
                        },
                        "onclick": {
                            "enable": false
                        },
                        "resize": true
                    }
                },
                "retina_detect": true,
                "position": {
                    "x": clickX,
                    "y": clickY
                }
            }, function () {
                console.log('callback - particles.js config loaded');
            });
        }

        // 初始化粒子特效
        particlesJS.load('particles-js', {
            "particles": {
                "number": {
                    "value": 80,
                    "density": {
                        "enable": true,
                        "value_area": 800
                    }
                },
                "color": {
                    "value": "#ff0000"
                },
                "shape": {
                    "type": "circle",
                    "stroke": {
                        "width": 0,
                        "color": "#000000"
                    },
                    "polygon": {
                        "nb_sides": 5
                    },
                    "image": {
                        "src": "img/github.svg",
                        "width": 100,
                        "height": 100
                    }
                },
                "opacity": {
                    "value": 0.5,
                    "random": false,
                    "anim": {
                        "enable": false,
                        "speed": 1,
                        "opacity_min": 0.1,
                        "sync": false
                    }
                },
                "size": {
                    "value": 3,
                    "random": true,
                    "anim": {
                        "enable": false,
                        "speed": 40,
                        "size_min": 0.1,
                        "sync": false
                    }
                },
                "line_linked": {
                    "enable": false
                },
                "move": {
                    "enable": true,
                    "speed": 6,
                    "direction": "none",
                    "random": false,
                    "straight": false,
                    "out_mode": "out",
                    "bounce": false,
                    "attract": {
                        "enable": false,
                        "rotateX": 600,
                        "rotateY": 1200
                    }
                }
            },
            "interactivity": {
                "detect_on": "canvas",
                "events": {
                    "onhover": {
                        "enable": false
                    },
                    "onclick": {
                        "enable": false
                    },
                    "resize": true
                }
            },
            "retina_detect": true
        }, function () {
            console.log('callback - particles.js config loaded');
        });
    </script>
</body>

</html>    
