<%-- 
    Document   : register
    Created on : Nov 19, 2016, 2:48:31 AM
    Author     : Georgio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css" type="text/css">
        <title>Register here!</title>
        <script  type="text/javascript" language="javascript">
        function validate(theform){
           
                
                if(!allLetter(document.theform.first_name))
                { 
                 return false;
                }
                
                if(!allLetter(document.theform.last_name))
                { 
                 return false;
                }
                
            if(!allLetter(document.theform.city))
                { 
                 return false;
                }
                
                
                if(!allnumeric(document.theform.streetno))
                { 
                 return false;
                }
                
                if(!allnumeric(document.theform.zipcode))
                { 
                 return false;
                }
                
                if(!allnumeric(document.theform.telephone))
                { 
                 return false;
                }
                
                if(!(document.theform.fax.value == ""))
                {
                    if(!allnumeric(document.theform.fax))
                    { 
                     return false;
                    }
                }
                
                if(!(document.theform.cellphone.value == ""))
                {
                    if(!allnumeric(document.theform.cellphone))
                    { 
                     return false;
                    }
                }
                
//                if(!checkAFM(document.getElementById("afm").value))
//                {
//                    alert("Το ΑΦΜ που εισάγατε δεν υπάρχει!")
//                    document.getElementById("afm").focus();
//                    return false;
//                }
                
                
                
                if(document.getElementById("password").value!=document.getElementById("conf_password").value)
                {
                alert("Passwords do not match!");
                document.getElementById("password").focus();
                return false;
                }

               return true;

        }

          
            function checkAFM (afm)
            {      
               if(!afm.match(/^\d{9}$/)) return false;
               afm = afm.split('').reverse().join('');

               var Num1 = 0;
               for(var iDigit= 1; iDigit <=  8; iDigit++)
               {
                  Num1 += afm.charAt(iDigit) << iDigit;     
               }

               return (Num1 % 11) % 10 == afm.charAt(0);   
            }
            
            function allLetter(uname)  
            {   
                var letters = /^[A-Za-zΑ-Ωα-ωΆ-Ώά-ώ . ]+$/;  
                if(uname.value.match(letters))  
                {  
                    return true;  
                }  
                else  
                {  
                    alert(uname.id + ' has letters only');  
                    uname.focus();  
                    return false;  
                }  
            } 

            
            function allnumeric(uzip)  
            {   
                var numbers = /^[0-9 -]+$/;  
                if(uzip.value.match(numbers))  
                {  
                    return true;  
                }  
                else  
                {  
                    alert(uzip.id + ' has numbers only');  
                    uzip.focus();  
                    return false;  
                }  
            }
            
            
/*            
            function SHA256(s){
 
                var chrsz   = 8;
                var hexcase = 0;

                function safe_add (x, y) {
                        var lsw = (x & 0xFFFF) + (y & 0xFFFF);
                        var msw = (x >> 16) + (y >> 16) + (lsw >> 16);
                        return (msw << 16) | (lsw & 0xFFFF);
                }

                function S (X, n) { return ( X >>> n ) | (X << (32 - n)); }
                function R (X, n) { return ( X >>> n ); }
                function Ch(x, y, z) { return ((x & y) ^ ((~x) & z)); }
                function Maj(x, y, z) { return ((x & y) ^ (x & z) ^ (y & z)); }
                function Sigma0256(x) { return (S(x, 2) ^ S(x, 13) ^ S(x, 22)); }
                function Sigma1256(x) { return (S(x, 6) ^ S(x, 11) ^ S(x, 25)); }
                function Gamma0256(x) { return (S(x, 7) ^ S(x, 18) ^ R(x, 3)); }
                function Gamma1256(x) { return (S(x, 17) ^ S(x, 19) ^ R(x, 10)); }

                function core_sha256 (m, l) {
                        var K = new Array(0x428A2F98, 0x71374491, 0xB5C0FBCF, 0xE9B5DBA5, 0x3956C25B, 0x59F111F1, 0x923F82A4, 0xAB1C5ED5, 0xD807AA98, 0x12835B01, 0x243185BE, 0x550C7DC3, 0x72BE5D74, 0x80DEB1FE, 0x9BDC06A7, 0xC19BF174, 0xE49B69C1, 0xEFBE4786, 0xFC19DC6, 0x240CA1CC, 0x2DE92C6F, 0x4A7484AA, 0x5CB0A9DC, 0x76F988DA, 0x983E5152, 0xA831C66D, 0xB00327C8, 0xBF597FC7, 0xC6E00BF3, 0xD5A79147, 0x6CA6351, 0x14292967, 0x27B70A85, 0x2E1B2138, 0x4D2C6DFC, 0x53380D13, 0x650A7354, 0x766A0ABB, 0x81C2C92E, 0x92722C85, 0xA2BFE8A1, 0xA81A664B, 0xC24B8B70, 0xC76C51A3, 0xD192E819, 0xD6990624, 0xF40E3585, 0x106AA070, 0x19A4C116, 0x1E376C08, 0x2748774C, 0x34B0BCB5, 0x391C0CB3, 0x4ED8AA4A, 0x5B9CCA4F, 0x682E6FF3, 0x748F82EE, 0x78A5636F, 0x84C87814, 0x8CC70208, 0x90BEFFFA, 0xA4506CEB, 0xBEF9A3F7, 0xC67178F2);
                        var HASH = new Array(0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A, 0x510E527F, 0x9B05688C, 0x1F83D9AB, 0x5BE0CD19);
                        var W = new Array(64);
                        var a, b, c, d, e, f, g, h, i, j;
                        var T1, T2;

                        m[l >> 5] |= 0x80 << (24 - l % 32);
                        m[((l + 64 >> 9) << 4) + 15] = l;

                        for ( var i = 0; i<m.length; i+=16 ) {
                                a = HASH[0];
                                b = HASH[1];
                                c = HASH[2];
                                d = HASH[3];
                                e = HASH[4];
                                f = HASH[5];
                                g = HASH[6];
                                h = HASH[7];

                                for ( var j = 0; j<64; j++) {
                                        if (j < 16) W[j] = m[j + i];
                                        else W[j] = safe_add(safe_add(safe_add(Gamma1256(W[j - 2]), W[j - 7]), Gamma0256(W[j - 15])), W[j - 16]);

                                        T1 = safe_add(safe_add(safe_add(safe_add(h, Sigma1256(e)), Ch(e, f, g)), K[j]), W[j]);
                                        T2 = safe_add(Sigma0256(a), Maj(a, b, c));

                                        h = g;
                                        g = f;
                                        f = e;
                                        e = safe_add(d, T1);
                                        d = c;
                                        c = b;
                                        b = a;
                                        a = safe_add(T1, T2);
                                }

                                HASH[0] = safe_add(a, HASH[0]);
                                HASH[1] = safe_add(b, HASH[1]);
                                HASH[2] = safe_add(c, HASH[2]);
                                HASH[3] = safe_add(d, HASH[3]);
                                HASH[4] = safe_add(e, HASH[4]);
                                HASH[5] = safe_add(f, HASH[5]);
                                HASH[6] = safe_add(g, HASH[6]);
                                HASH[7] = safe_add(h, HASH[7]);
                        }
                        return HASH;
                }

                function str2binb (str) {
                        var bin = Array();
                        var mask = (1 << chrsz) - 1;
                        for(var i = 0; i < str.length * chrsz; i += chrsz) {
                                bin[i>>5] |= (str.charCodeAt(i / chrsz) & mask) << (24 - i%32);
                        }
                        return bin;
                }

                function Utf8Encode(string) {
                        string = string.replace(/\r\n/g,"\n");
                        var utftext = "";

                        for (var n = 0; n < string.length; n++) {

                                var c = string.charCodeAt(n);

                                if (c < 128) {
                                        utftext += String.fromCharCode(c);
                                }
                                else if((c > 127) && (c < 2048)) {
                                        utftext += String.fromCharCode((c >> 6) | 192);
                                        utftext += String.fromCharCode((c & 63) | 128);
                                }
                                else {
                                        utftext += String.fromCharCode((c >> 12) | 224);
                                        utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                                        utftext += String.fromCharCode((c & 63) | 128);
                                }

                        }

                        return utftext;
                }

                function binb2hex (binarray) {
                        var hex_tab = hexcase ? "0123456789ABCDEF" : "0123456789abcdef";
                        var str = "";
                        for(var i = 0; i < binarray.length * 4; i++) {
                                str += hex_tab.charAt((binarray[i>>2] >> ((3 - i%4)*8+4)) & 0xF) +
                                hex_tab.charAt((binarray[i>>2] >> ((3 - i%4)*8  )) & 0xF);
                        }
                        return str;
                }

                s = Utf8Encode(s);
                return binb2hex(core_sha256(str2binb(s), s.length * chrsz));

        }
*/
    </script>
    </head>
    
        <div class="container">
 
    <body>
        
	<div id="forma">
            <div class="header">
            <h3>Φόρμα εγγραφής</h3>
            </div> 
            
            <div class="nav-bar">

        	<div class="container">
			<ul class="nav">
				<li><a href="#">Nav item 1</a></li>
				<li><a href="#">Nav item 2</a></li>
				<li><a href="#">Nav item 3</a></li>
			</ul>
		</div>        
        </div>           
        <div class="content">           
        <div class="main">
            
            <%
	session = request.getSession(false);
                    if(session.getAttribute("Error")!=null){
	%>
                    <jsp:include page="error.jsp"/>
	<%
                   } 
        %>
          <form name ="theform"  method="post" name="registration" action="doRegister.jsp" onSubmit="return validate(this);">
            <div id="contents">
                
            <table width="674" border="0" cellpadding="5" cellspacing="5">
              <tr>
                <td width="231">Όνομα χρήστη</td>
                <td width="308">*&nbsp;
                <input name="user_name" class="required" id="user_name" type="text" size="30" maxlength="30" autofocus required placeholder="Όνομα χρήστη ή e-mail"/></td>
              </tr>
              <tr>
                <td>Κωδικός:</td>
                <td>*&nbsp;
                <input name="password" class="required" id="password" type="password" size="30" maxlength="30" required/></td>
              </tr>
              <tr>
                <td>Επιβεβαίωση Κωδικού:</td>
                <td>*&nbsp;
                <input name="conf_password" class="required" id="conf_password" type="password" size="30" maxlength="30" required/></td>
              </tr>
              <tr>
                <td>Όνομα:</td>
                <td>*&nbsp;
                <input name="first_name" class="required" id="first_name" type="text" size="30" maxlength="30" required/></td>
              </tr>
              <tr>
                <td>Επίθετο:</td>
                <td>*&nbsp;
                <input name="last_name" class="required" id="last_name" type="text" size="30" maxlength="30" required/></td>
              </tr>
              <tr>
                <td>Επάγγελμα:</td>
                <td>*&nbsp;
                    <input name="profession" class="profession" id="profession" type="text" size="30" maxlength="30" required/></td>
                </td>
              </tr>
              <tr>
                <td>Οδός:</td>
                <td>*&nbsp;
                <input name="address" class="required" id="address" type="text" size="30" maxlength="30" required placeholder=""/></td>
              </tr>
              <tr>
                <td>Αριθμός:</td>
                <td>*&nbsp
                <input name="streetno" class="required" id="streetno" type="text" size="30" maxlength="30" required /></td>
              </tr>
              <tr>
                <td>Πόλη:</td>
                <td>*&nbsp
                <input name="city" class="required" id="city" type="text" size="30" maxlength="30" required /></td>
              </tr>
              <tr>
                <td>Τ.Κ.:</td>
                <td>*&nbsp
                <input name="zipcode" class="required" id="zipcode" type="text" size="30" maxlength="30" required /></td>
              </tr>
              <tr>
                <td>ΔΟΥ:</td>
                <td>*&nbsp
                <input name="doy" class="required" id="doy" type="text" size="30" maxlength="30" required/></td>
              </tr>
              <tr>
                <td>ΑΦΜ:</td>
                <td>*&nbsp
                <input name="afm" class="required" id="afm" type="text" size="30" maxlength="30" required/></td>
              </tr>
              <tr>
                <td>Σταθερό τηλέφωνο:</td>
                <td>*&nbsp
                <input name="telephone" class="required" id="telephone" type="text" size="30" maxlength="30" required /></td>
              </tr>
              <tr>
                <td>Φαξ:</td>
                <td>&nbsp &nbsp
                <input name="fax" class="required" id="fax" type="text" size="30" maxlength="30" /></td>
              </tr>
              <tr>
                <td>Κινητό:  </td>
                <td>&nbsp  &nbsp
                    <input name="cellphone" class="text" id="cellphone" type="text" size="30" maxlength="30" /></td>
              </tr>
              <tr>
                <td>Email:</td>
                <td>*&nbsp;
                <input name="email" class="email required" id="email" type="email" size="30" maxlength="30" required/></td>
              </tr>
              <tr>
                <td>Ιστοσελίδα:</td>
                <td>&nbsp &nbsp
                    <input name="website" class="text" id="website"  type="text" size="30" maxlength="30" placeholder="www.example.com"/></td>
              </tr>
            </table>
                      
        </div>
        
        <div id="button">
           <input name="submit" type="submit" value="Εγγραφή" />&nbsp;&nbsp;
           <input name="reset" type="reset" value="Επαναφορά φόρμας" /></p>
        </div>
        </form>
       </div>
                   
          </div>           
        </div>       
          
    </body>

    <div class="footer">
        &copy; Copyright gepapada
    </div> 
    
    </div> 

</html>