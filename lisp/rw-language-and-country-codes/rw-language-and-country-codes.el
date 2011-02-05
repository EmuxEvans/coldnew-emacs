;;; rw-language-and-country-codes.el -*-coding: iso-8859-1; -*-
;;
;; Copyright (C) 2009 Ralf Wachinger
;;
;; Author: Ralf Wachinger <rwachinger@gmx.de>
;; Version: 0.1
;; Keywords: language
;; Compatibility: GNU Emacs 22.x, GNU Emacs 23.x
;;
;; This file is NOT part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;
;;; Commentary:
;;
;; Language and country codes with two (or three) letters,
;; and functions, which return the full language and country names.
;;
;;; Change Log:
;;
;; 2009-03-20 (0.1)
;;    Initial Release.
;;
;;; Code:

;; Language codes
;; http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes

(defconst rw-lacc-language-codes
'(("aa" . "Afar")
("ab" . "Abkhazian")
("ae" . "Avestan")
("af" . "Afrikaans")
("ak" . "Akan")
("am" . "Amharic")
("an" . "Aragonese")
("ar" . "Arabic")
("as" . "Assamese")
("av" . "Avaric")
("ay" . "Aymara")
("az" . "Azerbaijani")
("ba" . "Bashkir")
("be" . "Belarusian")
("bg" . "Bulgarian")
("bh" . "Bihari")
("bi" . "Bislama")
("bm" . "Bambara")
("bn" . "Bengali")
("bo" . "Tibetan")
("br" . "Breton")
("bs" . "Bosnian")
("ca" . "Catalan")
("ce" . "Chechen")
("ch" . "Chamorro")
("co" . "Corsican")
("cr" . "Cree")
("cs" . "Czech")
("cu" . "Church Slavic")
("cv" . "Chuvash")
("cy" . "Welsh")
("da" . "Danish")
("de" . "German")
("dv" . "Divehi")
("dz" . "Dzongkha")
("ee" . "Ewe")
("el" . "Greek")
("en" . "English")
("eo" . "Esperanto")
("es" . "Spanish")
("et" . "Estonian")
("eu" . "Basque")
("fa" . "Persian")
("ff" . "Fulfulde")
("fi" . "Finnish")
("fj" . "Fijian")
("fo" . "Faroese")
("fr" . "French")
("fy" . "Western Frisian")
("ga" . "Irish")
("gd" . "Scottish Gaelic")
("gl" . "Galician")
("gn" . "Guaran�")
("gu" . "Gujarati")
("gv" . "Manx")
("ha" . "Hausa")
("he" . "Hebrew")
("hi" . "Hindi")
("ho" . "Hiri Motu")
("hr" . "Croatian")
("ht" . "Haitian")
("hu" . "Hungarian")
("hy" . "Armenian")
("hz" . "Herero")
("ia" . "Interlingua")
("id" . "Indonesian")
("ie" . "Interlingue")
("ig" . "Igbo")
("ii" . "Sichuan Yi")
("ik" . "Inupiaq")
("io" . "Ido")
("is" . "Icelandic")
("it" . "Italian")
("iu" . "Inuktitut")
("ja" . "Japanese")
("jv" . "Javanese")
("ka" . "Georgian")
("kg" . "Kongo")
("ki" . "Kikuyu")
("kj" . "Kwanyama")
("kk" . "Kazakh")
("kl" . "Kalaallisut")
("km" . "Khmer")
("kn" . "Kannada")
("ko" . "Korean")
("kr" . "Kanuri")
("ks" . "Kashmiri")
("ku" . "Kurdish")
("kv" . "Komi")
("kw" . "Cornish")
("ky" . "Kirghiz")
("la" . "Latin")
("lb" . "Luxembourgish")
("lg" . "Ganda")
("li" . "Limburgish")
("ln" . "Lingala")
("lo" . "Lao")
("lt" . "Lithuanian")
("lu" . "Luba-Katanga")
("lv" . "Latvian")
("mg" . "Malagasy")
("mh" . "Marshallese")
("mi" . "Maori")
("mk" . "Macedonian")
("ml" . "Malayalam")
("mn" . "Monglian")
("mr" . "Marathi")
("ms" . "Malay")
("mt" . "Maltese")
("my" . "Burmese")
("na" . "Nauru")
("nb" . "Norwegian Bokm�l")
("nd" . "North Ndebele")
("ne" . "Nepali")
("ng" . "Owambo")
("nl" . "Dutch")
("nn" . "Norwegian Nynorsk")
("no" . "Norwegian")
("nr" . "South Ndebele")
("nv" . "Navajo")
("ny" . "Chichewa")
("oc" . "Occitan")
("oj" . "Ojibwa")
("om" . "Oromo")
("or" . "Oriya")
("os" . "Ossetian")
("pa" . "Panjabi")
("pi" . "Pali")
("pl" . "Polish")
("ps" . "Pashto")
("pt" . "Portuguese")
("qu" . "Quechua")
("rm" . "Raeto-Romance")
("rn" . "Kirundi")
("ro" . "Romanian")
("ru" . "Russian")
("rw" . "Kinyarwanda")
("sa" . "Sanskrit")
("sc" . "Sardinian")
("sd" . "Sindhi")
("se" . "Northern Sami")
("sg" . "Sango")
("sh" . "Serbo-Croatian")
("si" . "Sinhala")
("sk" . "Slovak")
("sl" . "Slovenian")
("sm" . "Samoan")
("sn" . "Shona")
("so" . "Somali")
("sq" . "Albanian")
("sr" . "Serbian")
("ss" . "Swati")
("st" . "Southern Sotho")
("su" . "Sundanese")
("sv" . "Swedish")
("sw" . "Swahili")
("ta" . "Tamil")
("te" . "Telugu")
("tg" . "Tajik")
("th" . "Thai")
("ti" . "Tigrinya")
("tk" . "Turkmen")
("tl" . "Tagalog")
("tn" . "Tswana")
("to" . "Tonga")
("tr" . "Turkish")
("ts" . "Tsonga")
("tt" . "Tatar")
("tw" . "Twi")
("ty" . "Tahitian")
("ug" . "Uighur")
("uk" . "Ukrainian")
("ur" . "Urdu")
("uz" . "Uzbek")
("ve" . "Venda")
("vi" . "Vietnamese")
("vo" . "Volap�k")
("wa" . "Walloon")
("wo" . "Wolof")
("xh" . "Xhosa")
("yi" . "Yiddish")
("yo" . "Yoruba")
("za" . "Zhuang")
("zh" . "Chinese")
("zu" . "Zulu")))

;; Country codes
;; http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2

(defconst rw-lacc-country-codes
'(("AD" . "Andorra")
("AE" . "United Arab Emirates")
("AF" . "Afghanistan")
("AG" . "Antigua and Barbuda")
("AI" . "Anguilla")
("AL" . "Albania")
("AM" . "Armenia")
("AN" . "Netherlands Antilles")
("AO" . "Angola")
("AQ" . "Antarctica")
("AR" . "Argentina")
("AS" . "American Samoa")
("AT" . "Austria")
("AU" . "Australia")
("AW" . "Aruba")
("AX" . "�land Islands")
("AZ" . "Azerbaijan")
("BA" . "Bosnia and Herzegovina")
("BB" . "Barbados")
("BD" . "Bangladesh")
("BE" . "Belgium")
("BF" . "Burkina Faso")
("BG" . "Bulgaria")
("BH" . "Bahrain")
("BI" . "Burundi")
("BJ" . "Benin")
("BL" . "Saint Barth�lemy")
("BM" . "Bermuda")
("BN" . "Brunei")
("BO" . "Bolivia")
("BR" . "Brazil")
("BS" . "Bahamas")
("BT" . "Bhutan")
("BV" . "Bouvet Island")
("BW" . "Botswana")
("BY" . "Belarus")
("BZ" . "Belize")
("CA" . "Canada")
("CC" . "Cocos (Keeling) Islands")
("CD" . "Democratic Republic of the Congo")
("CF" . "Central African Republic")
("CG" . "Republic of the Congo")
("CH" . "Switzerland")
("CI" . "C�te d'Ivoire")
("CK" . "Cook Islands")
("CL" . "Chile")
("CM" . "Cameroon")
("CN" . "China")
("CO" . "Colombia")
("CR" . "Costa Rica")
("CU" . "Cuba")
("CV" . "Cape Verde")
("CX" . "Christmas Island")
("CY" . "Cyprus")
("CZ" . "Czech Republic")
("DE" . "Germany")
("DJ" . "Djibouti")
("DK" . "Denmark")
("DM" . "Dominica")
("DO" . "Dominican Republic")
("DZ" . "Algeria")
("EC" . "Ecuador")
("EE" . "Estonia")
("EG" . "Egypt")
("EH" . "Western Sahara")
("ER" . "Eritrea")
("ES" . "Spain")
("ET" . "Ethiopia")
("FI" . "Finland")
("FJ" . "Fiji")
("FK" . "Falkland Islands")
("FM" . "Federated States of Micronesia")
("FO" . "Faroe Islands")
("FR" . "France")
("GA" . "Gabon")
("GB" . "United Kingdom")
("GD" . "Grenada")
("GE" . "Georgia")
("GF" . "French Guiana")
("GG" . "Guernsey")
("GH" . "Ghana")
("GI" . "Gibraltar")
("GL" . "Greenland")
("GM" . "Gambia")
("GN" . "Guinea")
("GP" . "Guadeloupe")
("GQ" . "Equatorial Guinea")
("GR" . "Greece")
("GS" . "South Georgia and the South Sandwich Islands")
("GT" . "Guatemala")
("GU" . "Guam")
("GW" . "Guinea-Bissau")
("GY" . "Guyana")
("HK" . "Hong Kong")
("HM" . "Heard Island and McDonald Islands")
("HN" . "Honduras")
("HR" . "Croatia")
("HT" . "Haiti")
("HU" . "Hungary")
("ID" . "Indonesia")
("IE" . "Ireland")
("IL" . "Israel")
("IM" . "Isle of Man")
("IN" . "India")
("IO" . "British Indian Ocean Territory")
("IQ" . "Iraq")
("IR" . "Iran")
("IS" . "Iceland")
("IT" . "Italy")
("JE" . "Jersey")
("JM" . "Jamaica")
("JO" . "Jordan")
("JP" . "Japan")
("KE" . "Kenya")
("KG" . "Kyrgyzstan")
("KH" . "Cambodia")
("KI" . "Kiribati")
("KM" . "Comoros")
("KN" . "Saint Kitts and Nevis")
("KP" . "North Korea")
("KR" . "South Korea")
("KW" . "Kuwait")
("KY" . "Cayman Islands")
("KZ" . "Kazakhstan")
("LA" . "Laos")
("LB" . "Lebanon")
("LC" . "Saint Lucia")
("LI" . "Liechtenstein")
("LK" . "Sri Lanka")
("LR" . "Liberia")
("LS" . "Lesotho")
("LT" . "Lithuania")
("LU" . "Luxembourg")
("LV" . "Latvia")
("LY" . "Libya")
("MA" . "Morocco")
("MC" . "Monaco")
("MD" . "Moldova")
("ME" . "Montenegro")
("MF" . "Saint Martin")
("MG" . "Madagascar")
("MH" . "Marshall Islands")
("MK" . "Macedonia")
("ML" . "Mali")
("MM" . "Burma/Myanmar")
("MN" . "Mongolia")
("MO" . "Macao")
("MP" . "Northern Mariana Islands")
("MQ" . "Martinique")
("MR" . "Mauritania")
("MS" . "Montserrat")
("MT" . "Malta")
("MU" . "Mauritius")
("MV" . "Maldives")
("MW" . "Malawi")
("MX" . "Mexico")
("MY" . "Malaysia")
("MZ" . "Mozambique")
("NA" . "Namibia")
("NC" . "New Caledonia")
("NE" . "Niger")
("NF" . "Norfolk Island")
("NG" . "Nigeria")
("NI" . "Nicaragua")
("NL" . "Netherlands")
("NO" . "Norway")
("NP" . "Nepal")
("NR" . "Nauru")
("NU" . "Niue")
("NZ" . "New Zealand")
("OM" . "Oman")
("PA" . "Panama")
("PE" . "Peru")
("PF" . "French Polynesia")
("PG" . "Papua New Guinea")
("PH" . "Philippines")
("PK" . "Pakistan")
("PL" . "Poland")
("PM" . "Saint Pierre and Miquelon")
("PN" . "Pitcairn Islands")
("PR" . "Puerto Rico")
("PS" . "Palestinian territories")
("PT" . "Portugal")
("PW" . "Palau")
("PY" . "Paraguay")
("QA" . "Qatar")
("RE" . "R�union")
("RO" . "Romania")
("RS" . "Serbia")
("RU" . "Russia")
("RW" . "Rwanda")
("SA" . "Saudi Arabia")
("SB" . "Solomon Islands")
("SC" . "Seychelles")
("SD" . "Sudan")
("SE" . "Sweden")
("SG" . "Singapore")
("SH" . "Saint Helena")
("SI" . "Slovenia")
("SJ" . "Svalbard and Jan Mayen")
("SK" . "Slovakia")
("SL" . "Sierra Leone")
("SM" . "San Marino")
("SN" . "Senegal")
("SO" . "Somalia")
("SR" . "Suriname")
("ST" . "S�o Tom� and Pr�ncipe")
("SV" . "El Salvador")
("SY" . "Syria")
("SZ" . "Swaziland")
("TC" . "Turks and Caicos Islands")
("TD" . "Chad")
("TF" . "French Southern Territories")
("TG" . "Togo")
("TH" . "Thailand")
("TJ" . "Tajikistan")
("TK" . "Tokelau")
("TL" . "East Timor")
("TM" . "Turkmenistan")
("TN" . "Tunisia")
("TO" . "Tonga")
("TR" . "Turkey")
("TT" . "Trinidad and Tobago")
("TV" . "Tuvalu")
("TW" . "Taiwan")
("TZ" . "Tanzania")
("UA" . "Ukraine")
("UG" . "Uganda")
("UM" . "United States Minor Outlying Islands")
("US" . "United States")
("UY" . "Uruguay")
("UZ" . "Uzbekistan")
("VA" . "Vatican City State")
("VC" . "Saint Vincent and the Grenadines")
("VE" . "Venezuela")
("VG" . "British Virgin Islands")
("VI" . "Virgin Islands, U.S.")
("VN" . "Vietnam")
("VU" . "Vanuatu")
("WF" . "Wallis and Futuna")
("WS" . "Samoa")
("YE" . "Yemen")
("YT" . "Mayotte")
("ZA" . "South Africa")
("ZM" . "Zambia")
("ZW" . "Zimbabwe")

("AC" . "Ascension Island")
("CP" . "Clipperton Island")
("DG" . "Diego Garcia")
("EA" . "Ceuta")
("EU" . "European Union")
("FX" . "Metropolitan France")
("IC" . "Canary Islands")
("SU" . "Soviet Union")
("TA" . "Tristan da Cunha")
("UK" . "United Kingdom")

("BU" . "Burma")
("CS" . "Serbia and Montenegro")
("NT" . "Saudi-Iraqi neutral zone")
("SF" . "Finland")
("TP" . "East Timor")
("YU" . "Yugoslavia")
("ZR" . "Zaire")

("DY" . "Benin")
("EW" . "Estonia")
("FL" . "Liechtenstein")
("JA" . "Jamaica")
("LF" . "Libya Fezzan")
("PI" . "Philippines")
("RA" . "Argentina")
("RB" . "Bolivia")
("RC" . "China")
("RH" . "Haiti")
("RI" . "Indonesia")
("RL" . "Lebanon")
("RM" . "Madagascar")
("RN" . "Niger")
("RP" . "Philippines")
("WG" . "Grenada")
("WL" . "Saint Lucia")
("WV" . "Saint Vincent and the Grenadines")
("YV" . "Venezuela")))

(defun rw-lacc-get-language (language-code)
"Get language code from string, e. g. \"en\"."
(if (string-match "^[a-z][a-z][a-z]?$" language-code)
(downcase (or (cdr (assoc-string language-code
rw-lacc-language-codes))
language-code))
language-code))

(defun rw-lacc-get-country (country-code)
"Get country code from string, e. g. \"US\"."
(if (string-match "^[A-Z][A-Z][A-Z]?$" country-code)
(or (cdr (assoc-string country-code
rw-lacc-country-codes))
country-code)
country-code))

(defun rw-lacc-get-language-and-country (language-and-country-code)
"Get language and country code from string, e. g. \"en_US\" or \"en-US\"."
(if (string-match "\\(^[a-z][a-z][a-z]?\\)\\([_-]\\)\\([A-Z][A-Z][A-Z]?\\)$"
language-and-country-code)
(let ((language (match-string 1 language-and-country-code))
(separator (match-string 2 language-and-country-code))
(country (match-string 3 language-and-country-code)))
(concat (rw-lacc-get-language language)
separator
(rw-lacc-get-country country)))
language-and-country-code))

(defun rw-lacc-replace-code-in-string (string)
"Replace language and country code in STRING,
e. g. \"en_US\" to \"english_United States\".
Return a new string containing the replacements."
(replace-regexp-in-string
"[a-z][a-z][a-z]?[_-][A-Z][A-Z][A-Z]?"
'(lambda (str)
(save-match-data (rw-lacc-get-language-and-country str)))
string))

(provide 'rw-language-and-country-codes)

;;; rw-language-and-country-codes.el ends here.
