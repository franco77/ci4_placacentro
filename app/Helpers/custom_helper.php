<?php
// if (!function_exists('fecha_format')) {
//     function fecha_format($date_str)
//     {
//         setlocale(LC_ALL, 'es_CO');
//         date_default_timezone_set('America/Bogota');
//         return utf8_encode(strftime('%d de %b del %y', strtotime($date_str)));
//     }
// }



if (!function_exists('addBizDays')) {
    function addBizDays($start, $add)
    {
        $start = strtotime($start);
        $d = min(date('N', $start), 5);
        $start -= date('N', $start) * 24 * 60 * 60;
        $w = (floor($add / 5) * 2);
        $r = $add + $w + $d;
        return date('Y-m-d', strtotime(date("Y-m-d", $start) . " +$r day"));
    }
}



// Checking function already exists or not
if (!function_exists("getClientIpAddress")) {

    function getClientIpAddress()
    {
        if (!empty($_SERVER['HTTP_CLIENT_IP']))   //Checking IP From Shared Internet
        {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))   //To Check IP is Pass From Proxy
        {
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            $ip = $_SERVER['REMOTE_ADDR'];
        }

        return $ip;
    }
}




// if (!function_exists('number_days_skillful')) {
//     function number_days_skillful($from, $days)
//     {
//         date_default_timezone_set('America/Bogota');
//         $workingDays = [1, 2, 3, 4, 5];
//         $str = setting()->get('App.hollydays');
//         $holidayDays = explode(",", $str);

//         $from = new DateTime($from);
//         $dates = [];
//         $dates[] = $from->format('Y-m-d');
//         while ($days) {
//             $from->modify('+1 day');

//             if (!in_array($from->format('N'), $workingDays)) continue;
//             if (in_array($from->format('Y-m-d'), $holidayDays)) continue;
//             if (in_array($from->format('*-m-d'), $holidayDays)) continue;

//             $dates[] = $from->format('Y-m-d');
//             $days--;
//         }
//         return end($dates);
//     }
// }





if (!function_exists('number_days_skillful')) {
    function number_days_skillful($from, $days)
    {
        $db = \Config\Database::connect();
        $holidaysModel = new \App\Models\Holidays_model();
        $holidays = $holidaysModel->findAll();
        date_default_timezone_set('America/Bogota');
        $workingDays = [1, 2, 3, 4, 5];
        $holidayDays = array_column($holidays, 'date');

        $from = new \DateTime($from);
        $dates = [];
        $dates[] = $from->format('Y-m-d');

        while ($days) {
            $from->modify('+1 day');

            if (!in_array($from->format('N'), $workingDays)) {
                continue;
            }

            if (in_array($from->format('Y-m-d'), $holidayDays) || in_array($from->format('*-m-d'), $holidayDays)) {
                continue;
            }

            $dates[] = $from->format('Y-m-d');
            $days--;
        }

        return end($dates);
    }
}





if (!function_exists('generateRandomString')) {
    function generateRandomString($length = 10)
    {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $randomString = '';

        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, strlen($characters) - 1)];
        }

        return $randomString;
    }
}
















if (!function_exists('dates_format')) {



    function dates_format($fecha_mysql, $incluir_hora = FALSE)
    {
        $formato = setting()->get('App.date_format');
        $fecha_en = strtotime($fecha_mysql);
        $dia = date("l", $fecha_en); // Sunday
        $ndia = date("d", $fecha_en); // 01-31
        $mes = date("m", $fecha_en); // 01-12
        $ano = date("Y", $fecha_en); // 2014
        $hora = date("H:i:s", $fecha_en); // H-i-s (Hora, minutos, segundos)

        $dias = array('Monday' => 'Lunes', 'Tuesday' => 'Martes', 'Wednesday' => 'Miercoles', 'Thursday' => 'Jueves', 'Friday' => 'Viernes', 'Saturday' => 'Sabado', 'Sunday' => 'Domingo');
        $meses = array('01' => 'Enero', '02' => 'Febrero', '03' => 'Marzo', '04' => 'Abril', '05' => 'Mayo', '06' => 'Junio', '07' => 'Julio', '08' => 'Agosto', '09' => 'Setiembre', '10' => 'Octubre', '11' => 'Noviembre', '12' => 'Diciembre');

        switch ($formato) {
            case 1:
                $fecha_es = date("d/m/Y", $fecha_en);
                //Resultado: 25/06/2014
                break;
            case 2:
                $fecha_es = date("d-m-Y", $fecha_en);
                //Resultado: 25-06-2014
                break;
            case 3:
                $fecha_es = date("d.m.Y", $fecha_en);
                //Resultado: 25.06.2014
                break;
            case 4:
                $fecha_es = $ndia . " " . substr($meses[$mes], 0, 3) . " " . $ano;
                //Resultado: 25 Jun 2014
                break;
            case 5:
                $fecha_es = $ndia . " " . $meses[$mes] . " " . $ano;
                //Resultado: 25 Junio 2014
                break;
            case 6:
                $fecha_es = substr($dias[$dia], 0, 3) . " " . $ndia . " " . substr($meses[$mes], 0, 3) . " " . $ano;
                //Resultado: Mar 25 Jun 2014
                break;
            case 7:
                $fecha_es = $dias[$dia] . " " . $ndia . " " . $meses[$mes] . " " . $ano;
                //Resultado: Martes 25 Junio 2014
                break;

            case 8:
                $fecha_es =  $meses[$mes] . " " . $ndia . " " . $ano . " - " . $hora;
                //Resultado: Martes 25 Junio 2014
                break;
        }

        if ($incluir_hora) {
            $fecha_es .= " " . $hora;
        }

        return $fecha_es;
    }
}




if (!function_exists('monies_format')) {
    function monies_format($num)
    {
        $number_format = setting()->get('App.number_format');
        $currency_symbol = setting()->get('App.currency_symbol');

        if ($number_format == 1) {
            return $currency_symbol . ' ' . number_format($num, 2, '.', ',');
        } elseif ($number_format == 2) {
            return $currency_symbol . ' ' . number_format($num, 0, '.', ',');
        } elseif ($number_format == 3) {
            return $currency_symbol . ' ' . number_format($num, 0, ',', '.');
        } elseif ($number_format == 4) {
            return $currency_symbol . ' ' . number_format($num, 2, ',', '.');
        }
    }
}


if (!function_exists('time_elapsed')) {
    function time_elapsed($fechaInicio, $fechaFin)
    {
        $fecha1 = new DateTime($fechaInicio);
        $fecha2 = new DateTime($fechaFin);
        $fecha = $fecha1->diff($fecha2);
        $tiempo = "";

        if ($fecha->y > 0) {
            $tiempo .= date('d M Y', strtotime($fechaInicio));
        } else {
            if ($fecha->m > 0) {
                $tiempo .= date('d M', strtotime($fechaInicio));
            } else {
                if ($fecha->d > 0) {
                    $tiempo .= 'hace ' . $fecha->d;

                    if ($fecha->d == 1)
                        $tiempo .= " dia ";
                    else
                        $tiempo .= " dias ";
                } else {
                    if ($fecha->h > 0) {
                        if ($fecha->h > 0) {
                            $tiempo .= 'hace ' . $fecha->h . 'h.';
                        }
                    } else {
                        if ($fecha->i > 0) {
                            $tiempo .= 'hace ' . $fecha->i . ' min.';
                        } else if ($fecha->i == 0)
                            $tiempo .= $fecha->s . " seg.";
                    }
                }
            }
        }

        return $tiempo;
    }
}



if (!function_exists('textMin')) {
    function textMin($texto)
    {
        return strtolower($texto);
    }
}



if (!function_exists('get_month')) {
    function get_month($fecha)
    {
        $fecha = substr($fecha, 0, 10);
        $numeroDia = date('d', strtotime($fecha));
        $dia = date('l', strtotime($fecha));
        $mes = date('F', strtotime($fecha));
        $anio = date('Y', strtotime($fecha));

        $dias_ES = array("Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo");
        $dias_EN = array("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday");
        $nombredia = str_replace($dias_EN, $dias_ES, $dia);

        $meses_ES = array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
        $meses_EN = array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
        $nombreMes = str_replace($meses_EN, $meses_ES, $mes);

        return $nombreMes;
    }
}





if (!function_exists('num2letras')) {
    function num2letras($num, $fem = false, $dec = true)
    {
        $matuni[2]  = "dos";
        $matuni[3]  = "tres";
        $matuni[4]  = "cuatro";
        $matuni[5]  = "cinco";
        $matuni[6]  = "seis";
        $matuni[7]  = "siete";
        $matuni[8]  = "ocho";
        $matuni[9]  = "nueve";
        $matuni[10] = "diez";
        $matuni[11] = "once";
        $matuni[12] = "doce";
        $matuni[13] = "trece";
        $matuni[14] = "catorce";
        $matuni[15] = "quince";
        $matuni[16] = "dieciseis";
        $matuni[17] = "diecisiete";
        $matuni[18] = "dieciocho";
        $matuni[19] = "diecinueve";
        $matuni[20] = "veinte";
        $matunisub[2] = "dos";
        $matunisub[3] = "tres";
        $matunisub[4] = "cuatro";
        $matunisub[5] = "quin";
        $matunisub[6] = "seis";
        $matunisub[7] = "sete";
        $matunisub[8] = "ocho";
        $matunisub[9] = "nove";

        $matdec[2] = "veint";
        $matdec[3] = "treinta";
        $matdec[4] = "cuarenta";
        $matdec[5] = "cincuenta";
        $matdec[6] = "sesenta";
        $matdec[7] = "setenta";
        $matdec[8] = "ochenta";
        $matdec[9] = "noventa";
        $matsub[3]  = 'mill';
        $matsub[5]  = 'bill';
        $matsub[7]  = 'mill';
        $matsub[9]  = 'trill';
        $matsub[11] = 'mill';
        $matsub[13] = 'bill';
        $matsub[15] = 'mill';
        $matmil[4]  = 'millones';
        $matmil[6]  = 'billones';
        $matmil[7]  = 'de billones';
        $matmil[8]  = 'millones de billones';
        $matmil[10] = 'trillones';
        $matmil[11] = 'de trillones';
        $matmil[12] = 'millones de trillones';
        $matmil[13] = 'de trillones';
        $matmil[14] = 'billones de trillones';
        $matmil[15] = 'de billones de trillones';
        $matmil[16] = 'millones de billones de trillones';

        //Zi hack
        $float = explode('.', $num);
        $num = $float[0];

        $num = trim((string)@$num);
        if ($num[0] == '-') {
            $neg = 'menos ';
            $num = substr($num, 1);
        } else
            $neg = '';
        while ($num[0] == '0') $num = substr($num, 1);
        if ($num[0] < '1' or $num[0] > 9) $num = '0' . $num;
        $zeros = true;
        $punt = false;
        $ent = '';
        $fra = '';
        for ($c = 0; $c < strlen($num); $c++) {
            $n = $num[$c];
            if (!(strpos(".,'''", $n) === false)) {
                if ($punt) break;
                else {
                    $punt = true;
                    continue;
                }
            } elseif (!(strpos('0123456789', $n) === false)) {
                if ($punt) {
                    if ($n != '0') $zeros = false;
                    $fra .= $n;
                } else

                    $ent .= $n;
            } else

                break;
        }
        $ent = '     ' . $ent;
        if ($dec and $fra and !$zeros) {
            $fin = ' coma';
            for ($n = 0; $n < strlen($fra); $n++) {
                if (($s = $fra[$n]) == '0')
                    $fin .= ' cero';
                elseif ($s == '1')
                    $fin .= $fem ? ' una' : ' un';
                else
                    $fin .= ' ' . $matuni[$s];
            }
        } else
            $fin = '';
        if ((int)$ent === 0) return 'Cero ' . $fin;
        $tex = '';
        $sub = 0;
        $mils = 0;
        $neutro = false;
        while (($num = substr($ent, -3)) != '   ') {
            $ent = substr($ent, 0, -3);
            if (++$sub < 3 and $fem) {
                $matuni[1] = 'una';
                $subcent = 'as';
            } else {
                $matuni[1] = $neutro ? 'un' : 'uno';
                $subcent = 'os';
            }
            $t = '';
            $n2 = substr($num, 1);
            if ($n2 == '00') {
            } elseif ($n2 < 21)
                $t = ' ' . $matuni[(int)$n2];
            elseif ($n2 < 30) {
                $n3 = $num[2];
                if ($n3 != 0) $t = 'i' . $matuni[$n3];
                $n2 = $num[1];
                $t = ' ' . $matdec[$n2] . $t;
            } else {
                $n3 = $num[2];
                if ($n3 != 0) $t = ' y ' . $matuni[$n3];
                $n2 = $num[1];
                $t = ' ' . $matdec[$n2] . $t;
            }
            $n = $num[0];
            if ($n == 1) {
                $t = ' ciento' . $t;
            } elseif ($n == 5) {
                $t = ' ' . $matunisub[$n] . 'ient' . $subcent . $t;
            } elseif ($n != 0) {
                $t = ' ' . $matunisub[$n] . 'cient' . $subcent . $t;
            }
            if ($sub == 1) {
            } elseif (!isset($matsub[$sub])) {
                if ($num == 1) {
                    $t = ' mil';
                } elseif ($num > 1) {
                    $t .= ' mil';
                }
            } elseif ($num == 1) {
                $t .= ' ' . $matsub[$sub] . '?n';
            } elseif ($num > 1) {
                $t .= ' ' . $matsub[$sub] . 'ones';
            }
            if ($num == '000') $mils++;
            elseif ($mils != 0) {
                if (isset($matmil[$sub])) $t .= ' ' . $matmil[$sub];
                $mils = 0;
            }
            $neutro = true;
            $tex = $t . $tex;
        }
        $tex = $neg . substr($tex, 1) . $fin;
        //Zi hack --> 
        return ucfirst($tex);
        //$end_num = ucfirst($tex) . 'pesos' . $float[1] . '/100 M.N.';
        //return $end_num;
    }
}
