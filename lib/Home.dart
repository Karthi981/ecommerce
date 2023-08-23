import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/Constants.dart';
import 'package:ecommerce/Details1.dart';
import 'package:ecommerce/Models/Shoes.dart';
import 'package:ecommerce/youtubeplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'Details.dart';
import 'Models/FakeImg.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isGrid = true;
  final List<String> imgList =[
  'https://m.media-amazon.com/images/I/51jIFfkaDTS._AC_UF894,1000_QL80_DpWeblab_.jpg',
  'https://dlcdnwebimgs.asus.com/gain/8b25250f-bf55-425f-93bd-b5d8e2744b3e/',
  'https://data1.ibtimes.co.in/en/full/759126/oneplus-9-pro-review.jpg?h=450&l=50&t=40',
  'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxESEhUTExMWFhUXGR8aGBgYGB8eHxgbHR0eHR8fHx8fHSggHh8lHxgfITEhJyorLi4uGB8zODYtNygtLisBCgoKDg0OGxAQGy8lICUuLS0tLy0tLS0tLS0tLy0tLy0tLS0tLS8tLS0tLS0tLy0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAK0BIgMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAFBgQHAAIDCAH/xABSEAACAQIEAwQECAkLAgMJAQABAgMEEQAFEiEGMUETIlFhBzJxgRQjM0JykaGyCDRSYnOxwdHwFSQ1dIKSorPS4fFUwkNTkxclNoO0w8TT8hb/xAAbAQACAwEBAQAAAAAAAAAAAAADBAACBQEGB//EAD0RAAEDAgQDBgUDAQUJAAAAAAEAAhEDIQQSMUFRYXEFE4GRsfAiMqHB0TPh8RQGIzRCUhUkYmOCkqKywv/aAAwDAQACEQMRAD8ApnLsvlnfREuprXtcDb3keOC44JzH/p2/vJ/qxL9G2Vx1NWySX0iJm2O+xX9+LHybJaWUkRPUqQL/AChAte3QnxwRrQRMo9OmHC/r+yqCs4eq4vlIWX22/fjSlyKpk9SIt7CP34ujNKKGNuxeac3UsxZtSqoG5IKm9hv4eYwM4NyeoXtOz+MTUbMgQkDexswB352BFrfVcUwR/CG7uw/LKrOThatUgGEgn85f9XljhUZHUxo0jxkKhAY3GxPLr54t7N8qlC60mQkOoKPEVYEsF373n4YTeIvhIhqUJQqdDOR5MLWv544+mANVcUxz9goDlvBOY1CLJDTs6MLqQybj3tjMz4Nr6cAzQFATYd9CT7gxNvPkMXV6MK9FymnJ5qsl7ddLv+wY1i4SFSj1lVKTqJ0xg25Erub3ttta3ttthVz4BPBBpDM6CqCfK5gCSmw8x+/HagySomYLHHqLGw7yjf2kgD34sfNIqQXGkAjkAoufZ4nlt541yPLYpwezDIRv0+3Tbf3e/AP6rktH+hb/AKkp/wDs5zb/AKRv76f68DW4ZrBUrRmE/CG5R6ludi3PVbkCeeLmgziZYxEzHugA25nn152sBywocO3k4gDDbQpO36HT+tsGc8hhfyWfBFXuylt/Rtm450jf34/9ePg9G+bf9I39+P8A149ISMFF3ICgXLE7ADmSeVhgNQcXUMqyNHOpEeokbgkLzKg+sPAjxxnDHVjo0eR/Ka7imNT6KiH9HOagXNKwHiXj/wBeMX0dZqQCKUkHkRJGQf8AHiw884xkk0/GGNZG7NFW3daxtquLm/67WA54P8ISGl7HLlVi6oZZXlNrBmuQg5t3mt4DfckHD2J/qcOwOflk7C8b3v6SNgSUnhqtHEFwpzbciJ6ePGDyggmm6j0fZpGjSPSsFRSzHWmwUXJ9bwGH38Gr5as+hH95sWNxY38yqv0Ev3GxXP4NXy1Z9CP7zYphMQ6tOYaI9amGRCubij8Tqv0En3Gx5sPM+3HpTij8Tqv0En3Gx5rPM+3FcT8wXpv7OfpVOo+6+4zGYzCy9Gvl8ZfH3GYii+YzH0Lc2G5PTBSbh2qFJNViI6Y1vc2HvseijfxOwA3uOtGZwaNSgYjEU6DDUqGAPcAblBpplT1mA+ljIZ1cXXcflf8A9WwmySMxuxJPicMPDzgxkX3Dfk/lbf2sGq0cjJmVlYDtc4vE91lytgxe8j6cdPNFSfHGEYiZogMT6vyb/wBobD7MRuGZWdWTfu7jrsefuH/dgTWywv4LRq4oU8U3DkfMJBncbERw3nWyJ4y+NyMfMVTcL5j5j7j7iKQtb42vjMZiKLL4zH3GYii4ei0sKmoKmzCllINr/k+fPD7kJlFTFGjCMyakDaS1iV1nu+yMbkj1sIXosk01MzWBtTtcHkQXjUj6icWLWTRrdlM1PbcOlpFO26sNmG97EkjljZYbEcV82bApyZtw92QXOTeSVpJBIVGhr3ClEnRm2F2AKobgX2Bwf4DrkiA0yhWeo0Oo7yomlLWLKOp5m/PmeeBlHw1VyEzNpikuxtMwXVq5C/PUQSe8LNzB5jA3+QqoSGmCqjHv96UANfYEEnf1enLrbbBg+nFz1SLxV2HTz4p/43kiuUWSN2Au+4Bj0kEXtsSTtbbYk+GEPi2j0iba+qnc2A5abH7ADjrktAzBxKQhLgHVqJ7t7glCdLX3swF9iMGeLqJ2hLRhWAikRiDe4eNgfA4TxLgIDL6yfI/nzWjgi/4jUtOg85+3jK+eitO0ylV2G8qknoCSf24GQcW/zfswxvfu9QQdufLry8cL3BNTI9EIO0Ko07qANu8Ygy38RqFreeFksZRUIV0Ol5FttbSw7RfZvrt0KHxOA1mtiXaT+3lx4C6Fh3FkkbqdmmZNLK9rAKSBa/zTa/nc7+P6sNHDebjSsrm251BQLlgfZyNx4Dl1ucV/2hclirqSe9pFwT1sDyPlvgplVSpLMQRFCl9N76izKAG5aruQxHIhLY5XDQ2/s7DxNk5RqQZVj5ZG093BUDYc7kW6WHkRzwJ4Bhvn1QAb6EYXt4GNf24m8JVzSLqBOguEUeJ3Zjv4Wtt54AcH59FSZlXTuCzFnSMDqWmHP80WF8VqFxoFo4Jd7YxUk63Tz6QEWqpaqZS6GnFjpGoTBXPdZfyQe8D829+QN6pyuD4RIoiu1mD9kWGp1BIOjkL2tdTvttfkHCp4rqhH8Fi0rcaXbSGuCLle8LdWubXOqwtzwj5hlnwY6kkLFbMyiy2B2BBDtex2N/EWuLkTA5mj4+Mjp098FMUwukNsNJv6/fbZO2WZrT/CkeSNj2TX0OgVlPvKsGv7Ry88MUHHAMhdae0YUrHqA1jfcXLbKDfu6jz52sBXuo1QLsyGSMDUOUrhV3ubWIUe/u3v0xPy3JJ62QCCIEBRvyUWJFrlratgSADti+LcK5LnkcDsFMBSZh2tbBjUAmfrdMmfcWVE0Ey3jRWjcEat7aT0UH72OP4NXy1Z9CP7zYyt9HNVHTTSM0KhInYgXJsFJ59kN9vHGfg1fLVn0I/vNgeDDBmyI2Ne1xbl5q5+KPxOq/QSfcbHms8z7celOKPxOq/QSfcbHms8z7cdxPzBb39nP0qnUfdZj7jMSaahdhqsdN9Or848gPEnwHjvYb4Uc4NEleiJA1UXEpaQ/Zfbf/n3beexxPpModm0xqGN926L9exI69Nrb3vhuyXhZFYXBlkb6rnntyPtPtwliMaynABknQC5P49Tw3S1bEspi/v8JVy/J5pBdE22vfYHn169Njc77jbFqZRlTSZXJTyGNm0uAWHcB090kEEWGxuQeXLbChxBxNFTa1BieVSV0GeMbj2Mbewgcje2FPMfSRXmlkhQUiJKCraZNUihhpNu/wCHzgD7cHwLcWa+eszK2DrE3jx24BeZ7Sx7MTTyMIJmbfnRVfbBrJJ2QNYKbnq9uXl87A6OC/NwPcT+oHHdMv1HZgR+b09zFbY2amUtg/dIYLvqNUVKYk8i2b23nzIRYZkrqwbkVI5N7vnXOIfDk6xVKan0ox0s1tgD4g9AbE38McGy9ALmWyjY3Q6r+Fjt9uJUWXoY2lRQwUXGtgSw691T3bc9ycByMDHNE3tpp5+adrVcTWex7y0OZecwJ46NzWtvbUTeE4VmZUKOTrEosQTGDpG2x3sL/mqTy6csL1FmJnmsi6IhuS1yR4XIHU+XjgVlmXVFZII4lLH2WVAep6KP1+eLgyrguCCm7EWMjbtLbct/pH5PL6zjKxFWhgWhjnFzjtPyjjEQPKeEprD9oV6723IYNeJ5bwBvBOngkV0K8wR7caYN5jlrQt2cgCgklWHqnbp4eY/V1DyxlTY+32jBadRrxI3059Pdl6Vjw4StMfcZjMEV1mMxmMxFxRvRiR289/8Ap2/zIsWhlQ1NYgEEcjuCMU9wZkcdbO0UjsgEZYFQCbgqLWPPnhvi9HMqMOyrWS/q90qf8L8h+VsPbhyrVptJY50E30PvZfP8M5zWyGyOqtPOsrVYSyboLDs2JKgE27vVefK5HlgfldBSuwDP3TzilUEew37pxWUuX5ygcw1s00K7atchVgNyQrXFrjn5Xw8cD8CwVlBHW1lTUF5AzsRLoVFBI9gAAuTjlDMW5XODvOff15qlT+7HykSjma8NQJZ4m7NpCAojc6XIFwCGuo2HS1wPLA/PcmkSEEySajt3xpAFuQsLC46k7448V+jihgozPFLUN34tJ7clSHlRCR09VzY+eDNR6LstUIr1FSAzaUVqkjU1ibKDzNgTYb2BwXuufvrqhtrAbfVVZ6M6YzU0sanS4l1I3OzWS1/LukHyJxzquDK01tQY41CiPtH722mW8dh5kh7eS3OHqb0X08NdDTRVFRHBNFJLIqvYkwmNQNVr2Pbb+z2WNp6MMtZ2jE9SXCgsoqDcKSdJI8CQ1r+DeeOuYSCAdeUoDDlN9FSKUYGtXcRyBm7QOQpBueht7/O+No8ucjRGQ0bkLe1jt8Ze23dF7Xvvq9gxZ3DvomoZ2qxO80jRVLRq5exK6Ucattz39z18sb5l6LKKKhmqIKmZnjieRJBIGUlAW02AsVuLYj6eZNUq7AfjBjkfylqhqWo6eEpGJW7QRiPUFJkkuNRO9uVhy9Y4CHhytpJe0rKNkWpnRFftE7rOzG1hqLAi/h6vPFn5L6MMvjhp6ieaUuOzfW8oVe0JXSLHbdiFA57gbnHb07PIKWjMS6pBWxlF53bRJpHvNsWDYF0Go8GoXNnlPDgl08JrJfUoBPh6vQ+qSeo8BiNmXBUxVmj7IvcsNS39gFrct9/PlgYIeJpTcQW8vil+81/+BicuRcUFbtOkY83j296qT9uO93UFmqneU9XIZmvDdRGwk1BXUd1ljtYjfnvzxF4enrFijkgZoRKWN4jsVBtyF9lIsBtzPIY3myrM3YrLmZI5Hs2mZf8ACgQn341ofR4kt0OYWYKzhDCwJtuSAzi/tF+YwMUnOJa5wJ029LJg16bQ1zWEDXeD4wUezKvvRzmbMavWUkCJqBR+6dIbSzW1HYgna+M/Bq+WrPoR/ebG1V6HaWOllnNTMzJC0igBQCVQsAdibbY1/Bq+WrPoR/ebHaWH7mb6qlXENrQWiI5z9grn4o/E6r9BJ9xseajzPtx6V4o/E6r9BJ9xseaup9uAYn5gvTf2d/TqdR90QybLGqH0jYAXZugH78WHS5XGtha4UEILbKDz25Enx9vnhZ4RoXMltPdU7abG79BfwAa1h1thyqoZ42gLIEiftO2eQhRGVvoNyeRtbcD1h7MeexVLEYmoW0bho6cN+JG1rWOpCY7RxjabgHOgLIoVVbKAB5Y3FGs47F5pIUYjtGjOlnUf+GX5qrG1yNza3I4E1vGeUwGz1RlbqtOhbfw1NYYhfyrNLapFDPBBESyzVFye8CptEoTUNLEbsRy91uzuysZTqisYaRx+KdtjbrMjqsXFY2g9hZczw/KWfS9w6lL2cVLQtHTx7mqsW7QsB3dQ+av525N7ctx2Q5LQTURY9t2oAGsFQodjZUPcuBdr3ufVP0cWtk2ayPGJFlUhixVkBVStzpuNTXNutzjlmMCtGzrFFrVu1J0hNVkZGNwANWlvW52Ui/TGmztei+t3BBBmJFwSJ6G+1tfNLDBVGtzNNiOhv5jmb6Jfr8lWkymkpjHqMo7YyHbvk6tLLyayMAFJtcX6YQZOH01Al9O9zYjkPJQFA/jfF9ZZlTT5VFTzj41YFXmGKuEsp1A2LW6g73v1BxT3EmVNSron1Jq06jbdgV1aQeXkfYcMVC8PsdU3gzRfRyvAlusnXgfsjNHwpBPTrNcL2bWsVuAptc7d487+4+3DHBw7RxIYmUu0iFFfSLaXGnu7kcjitqbOZCTOzHYgDVKEJAFrW1C+3d23seeGePjuJad4hEY5I1LRh2ZlBICgAka/Xfkeh54CaVQ6fwjVsTTBM6Hhba1/TiLIh6PKBYqGIixLjWzAWJLb2PU6fV38MMhwN4bRVpYFX1RGtjyvsN/24JY8din56z3Hdx9Uek3Kxo5Bca2jSVCji6kfwR5+eEjM8kMT6HJKMe61hsPE25kAb8v1WfscKunWRdLC/wCw4JhcW6iY2PuRz9U1RrGn0VU1EJRircwbf8Y54N5tBKxYMveTu3A2IFz4fk7j3+OARx6mk/M2Try09kLZY7MJW2Mx8vjMFVoUX0Y1KR1jM5sOyboTvdeg3/jpzFp5bS/CWLXJjY97vAs/k1tlUDbQu3jfFRcCUU01SVhfQ4jJvtyBW439uLLpcvqoZlkDncAN3Quo9QQCQwHRtj5YvimjvCZ4Lw+C+QW49FYrFUppECgWRrD+ycCOBf8A4cX+rS/9+BXEfF0kCvEsBY6bM91+dt3VJDPa+9uWJfoqrK5crp1FLHJHY6GEwUsupvWUrsRy5m+D4QQD4fdKYsQ7z+yLcS/0LH7KX/Ohwx5tNTq1OJgCzTBYdibS6HII8DoD7+0dcBvSHJbLXZxps8BYc9Np4ieXO2IGdcRUtTUZckMmphWBiNLDYQTjqAOZGG0ou/E+Tw1WZ0STqHRYKhgpvbUGgG9juLNy8vqLZLR0UFRNDTQrFKER5NK2urFwlz13V/Z78ReJKOsFZS1NNFHKI45Y5FeTQbSGIgqdJ3HZ4C5z6QpqWpFM+Xs0xjEto5VPcLFeZA6jl7MTWwXCYuUf4R+VzD+uH/JhwKov6Bn/AKvUfqkwv5RxpV07VDNlc9p5zKO+gsCiLbc7nuX9+IdLxTVDL3ov5NmLNFKmoSJtr1b2v01fZi2R3AqveN4jzTlxR/RUP06P/wCogxC9L1tOW35fylBf6nwKyn0hVkcEccuVyF0UKxWRLEqLXAJuL+G9vE4Dca8YPWfAlkpTTJHWRSmSWaO2ldQI9bwa/ux3I4HRQvaQYKtdJY/mj7MRcxCvZGF1a9x4gdPZywNpeK6BnEa1lMSSAAsyEsSdgAG3J5W8SMBeL6U19PCqh1DsHDFtK7hjpJDXvsOht0xet+m4jgh0RL2h3FAOM8+ghlWJd3t3Y47bAeO4C/7HCPxdUPJFHPGzKyN0b1bjy6g7X88NNfEqSqNBAjUIJC3eIVFQ3tcgHzJ2PnsP4ibtI2jSNRcbAe2/Mnc+Zxh0iGuaQN16N7M1NwPD9/VOvD+d/DMkmk5OsEySLfkwjbl4AgggeeFr8Gr5as+hH95sdcvr1hoayA+t2O4B9Q6XIB8DZeXg4xy/Bq+WrPoR/ebGuHmoxryIlYjqQpPLQZVz8UfidV+gk+42PO1AnfZtjpGoAi+o7BRbruR9Rx6I4o/E6r9BJ9xsUVw/SBnUsCRrD8hyW5HnuVI2xmdovDGEnh7+nlqvT9guy0Kh5j0KcOEsqf5JRy3Yna5N7knnsAL+ZA6YHUfBeW1NVNEMwjmu7MsCtdk0ryBYsGAueQ292zHTUxlpamCFtEk8TrGxJ9ZhsL8xe/PFT8DcF5nFmEEj08sKU8qvLJICihEa72Y7OCAR3b3v4G+A9isaaTqwPxON+UcvGfFZXatVz60Hb6zqrByytpYD2eUZf20g9apMZjhTnuZHOtrW9XUFPS3QLxVmVRKrRmaSsqmRmUQi0EFuqi3xjbWFgSPyjbEnifM6ypWOTQUpFZoVRWuoKX0vIt9RZltZDsLG9+WB9LxslLDCscUjSmQmZ9JDGPUVUardzV+aL2tsNsa4IOizS0jUKdwHmEgp1SrkEdtfZqqLpO0Z77DcPYNpX512/J2apArDuuGB5FT4fxuPPFc0dAlPUSQgSapjK+tgQhMIc2Qkd6xY3O5FxexG52HOxS0Jlk1HWwEZO4QGwuRe9gRuOu3LcjC7TwQrVczLPtBk6g209YkWva+zgbYcucbAm3L+ZT3wlPaJ4pLJJ2j9kmrd02ba571yxBNtvdfFa+l2rD1USSsezXU1r8yyqDe1t7Abc/W8ric5z2oqNEyykot+9EDrCLcBjErkRC/qsX1m17m4sqZlXz1EgldtUmkXJtqa3Iki2ogWFxvYC+NOnOX4jfeLD9ksWw/ML73vvPjbXeZ2ui1JDO4d6dYVjUlTIYg5Y2va7K7Dna48dz4S8611Bgp2VPhTBr6EC3ux2JXaylLkHpc3PIqsNTKCNIKkXClGKkEm/Mbm1zi0fR/lEh7Ssqe9K1o0J5gesxv1JNhf6XjgOIf/AE9N1S1gSOJMWnjzRWg1nWnaeEeNk10VOIo0jW5CKFF9zZRbfz2x1GPt8bY8GStcWWDGHGYzFVEMzeMKpmt3lH1i/I+I3t9XhhF4kVBMQi6QFUW8CAP2WxY9XCHVlPJhb68I3E+WFAsgB3vq/N5ADmf9+eNnsuq0PAcb3A8Y/B809g3DNf37v5pdxmPmMx6FacrX0R1JjriwF/imH2ri1o8wvUAStpBYWGkkEbHYgeO1vLFQ+jGMNWMp6xN+teXgcWhXh6VO2kZwFtpPaX1k8gAQTvbc3sBc9MWxV6sdF4vBAdxJ5qdxJWRNHJHtra9iRuqg8z9g9/kcCOGckzaOKOGDNGihVAV/m6EBWudrm5OrUOfT2Aoub8QSX1ayGkcMxUkNpXkAQQQL7Df5px0yT0gVlMRf4yPcBXvcAm9g3X2kE8998Wp06waSwxPL73S2IdTLg0jTn/CepqSrfMIKGuzOSWBk7fZI4hrjcFVPPULi9vZ4YsTjDJoamKIS1D03ZSrKkkbKh1qrAC7Ai1mO3l7cVTxJmNPX0tPViO0oniQE81HakEbEgXIJ9hGLQ41pDI1ANGtRWKXGm4C9jMLt4C5AuepGGsO9zm/HqLFJVWBrraFD8uqHjzCnhXMJKqOSKdnVzEdJjMWk/FxqR8o3Pw8sSuIOEcrzCqPwmLtKiOJb/GSLaMs+nZWA3YP57Hyx9rKOKPNKHs40S8FVfSoF7Gn529uJVD/S1V/VKb/MqcHQ0l8N+jXLZpaxZ45JVgqOyhDyyfFx9nHIFGlhsDIRv0Ax2zL0cZK1FNUU0JVkjkaORZZbq8YO4DORsy+HTDZwh8vmX9c//HgwLzfPpGoqkR5bUrGYpRqvAoHdYFtJmD26+rcjpiKIVRejTJUpI56iB3JRWkcyTFmZrXNkbqT0GBdVwbkLzUiU8bRk1A1lu1syrHI+g9tdSGZVBHMi9uuHbNs9NBlIqggkMUUR0E6b3KLzsbetfl0xW3EXGdVWyZfFNRCnUV0EgcTB7m5AFgBzDXv5YgCid+JPRzlTrHstEVfUskOiNiQDYaiD7duoGEHOcpioa6ljgrZ50dJCdcwcKwHdsFsBv44tXiqk7Spy4FNaCocvdbgD4PKAW2sBqIG/UjCdx7kiyZvQRRJGmqGUnbSNt7nSN8WYQDfTdQaoDn08aSK40srL6pALBhsSxtf9nLwxwpzFHokkGoqpfSDsT0BP1Da++HbNOFIUh7xLXteRdrHba24A8D4m3OwKFntPGkqrGzMnZ76jchwWBHLYCw+vGQQGOLR4Hlstam/vW3KnVmUjsq2oZu/LG7uOQW0ZAHP+L45/g1fLVn0I/vNiHxjn0bUbA2LSDSFHjpAv7BZmHmi4mfg1fLVn0I/vNjXJBa0DgFlOmTPEq5+J/wATqv0En3GxTXDjDVyawTQem7kHY32HfJ+323LxR+J1X6CT7jYp/hirRiQw79xytsoVANudtgPbjC7ZnJp7svR9jf4ep1HoU2K2JS5yySQo+uXtHEaJbV3jc6rEgdwAuT0CnAOqzLRURxEbODv59MZxTmJpaZZ4xqnkkEEA8WdlL+Y7ilQR/wCacYfZVCocSyDAjMYOoB08TbxKmPGWjJGunjb7bJYzw1FG80RDGNnVZAgLAhGDAqed1I5Na4JwszaIwdLI6Nc6nmaxUm3gdwdvEbYfeMzOKlpIWVonLX0gkhkdo3sLm/fjb+NsIub00TFmZY78zuVvvezaRcdOnTHpqDzTflPT3wiVTF0W4miKrdYnqYE9dPoL6y0ZdkyVkgn+EuJraRfvBWePmN+8kiKTvvsfEY04npXip1ppVjIJv3GY90b/AD9wSST1tp5468CxU0oaR2ZQgUErK0aoyqFAuCpPdvYncb4j+kWop3EMMBuwftFfchlFg3xjeu3U2J2XA6mZ1Qid/JGwJbTewZdpy2uSN9b9deeiQ6eJoGVomJDd9UIBJ0jqCCpYBri48ffKFNDPf4P2hnAB0DvdpcAs17L2YHe3Gq9+gNwHrqxgKcjmiX999vsC4KHcLNHfSx3TUQATswNtyv779TZm4gu3n72PWPVAqUqdRzxQEZQDl/4SGkka3DiQRpcWmSZdBnKhWcQq5C3+L7pXmbHYggC24FwL3JtfBio44YwU60o0SIW1xnvBlsCLm1jdtfLltywEe73qYQAUF5CCI41C2ChBsS/dHW5PQ2LYg584bRPD3R85du6zdSBsAwF7cvLfHBRpPMOb4G/gRp9EtUrVskZpA8+s78/m+pItzhviCOrQsps6+svh4EeIODYbFIZBJJE6tHLocqWFjqFtRVlb3j1T0IN+RxZOScYU0wCyN2Mo2ZX2XV4BuVj0vYnHlu0ezTSeXUwS3zjry4HzWlSeX0m1Dv6jUcj12vxhkklAFzsP37YztBe3UYGZ+SUAHK+onyH/ADf3YD5Lm7NVOp3DWF7dUB5b8ue/swjTwxfTL27Any9lNto5mZht7/Pkmeok6eJwEzFWkjqYwe8e+B5WHj46Ty/XgnVy6SL9Tb6z+/ECskC6i3IgC/Ib3W3O3Xb24tQ+EgjWxHUEH7LrJAke7hV2cZj4xxmPYZQtuAhPA4b4T3SwOk7rfxHO3TD4+WVkyL2zF2ChlDHYGwJFr2v+u1sK3oniDVzA/wDlN9epcWPnHEIUjTEWNt9MZOogfNB8fHa9x0x3Ez3nkvCYR390Bwne3vwlU5X1Cs7EeqNl+iP4v78OOUejbNK2ninRYFjcXTW5DFehNgRuBjpxTmUnYv22WGNWUhZGjGxI53t3Tc353xZHA2XZnJldOFrIIUaEBNNOWZFIsp1GYAtyPq2v44cpGW6R5H0SNazpBnwI9Ui5vwhnNNT09OyUwjM0SK6MxKyM4Cs9+hY7kKeeLHlzzOonghkpaMyTFlUidwCUQsb/ABewsPPBbjgWp6cE3/nlJv4/ziPG/EP49l36SX/JbF2sDZje6E57nRO1ksLJnEmawmSCmXsqd7aXdlXtWAuzaQbnsbAAWFj44zOKzOaWteaKgSp7WCJCY5CFXs3lNu9uT8Z7OWDVXmTpncMC20TUpL3G/wAW7lbb7eub+7EjMqytkr2pqeaKJEp45SXhMhLPJKhG0qWAEY8eZxZVSdwfmmdvUVxFDAmqZXdJZSpSQxRiwKhr9wI3IW1c/CXxNn+aGCaCRaGnLkwamknk3dFPdCQG50yAC/XoerFwXHMs2YiV1kkFSmplTQD/ADaC1lLNbaw5nlfyxEyml7ejnnZ5O27SpGoO2luylkjQPHfs3ARFQhlNwPfiKJW4gr6ypoGoW+CIrIqa/wCd3Ggqb2NJ+b9uFmvoqoiItU0SGCRJVYrV7NHuL3p7W8cHcjz4OgMepoHQSpvq+DNcrJA7H1VRwSjPYFGAHq45zZmAyS9pEo1NHGQxk+OKME0iJJAXVnRgp32U+GKio8HKAomBePMw7dYOyoiTTfCe0Ek+jswxU7djrvdSbaeXXC5mOd1VRWR1oqKD4qNo40AqyBr9YkinBJ6eGFNslzF55JI8zd6iHTFI7NVI8etiFjLtGLamuAt7E8sHnSR5I5Kh7okAFZUIUa7xtIzeoT8Z2YSMFrFm03G2OPkCwlcM7IynFdf2Mx7TL5Y4Y2eVEFRq0gWNu0jVbnUp0ki48r4X8+yzsJtZVpI3F9m3W/zWJ3t0B6jzvg3QUBraTtqiokjglUlKaCbTDFFc2VgPlH2uzNve98K/G2avVSNHHr7KFO+dNiguASQbHdrbXvYctjgbmNdZEpVHMPwpanry7M2hWXS6xqPmnTYvYDfyJPTw2L9+DV8tWfQj+82ESMOUcoqhREVHiqhT5AFiLkm3U8r2w9/g1fLVn0I/vNgreC47VXNxR+J1X6CT7jYojhlbO7c9Ks1hudvIc9wNvZi9+KPxOq/QSfcbHnikq+zJIHNWBPjffncEe7pjP7Ra57crdwvT9gAmhUA4hTM2zPVU9rGSdJGnUL8ulj0vf2Xw15lVLUplKBT23wg1KjbSyRSWkXc31aRr9iHqQMV6xwYq4KioigMLsJKYF6WwHrodc0ana7FNEyg3vokA64rhKLGvEDRpA6WP2lMdusDMMwtGjh5QfvCGcR8TVENdVQMzBEqpytuah5WYjcbqSdXvJHM31/8A9LrNtXaKfmnYj6ib8vAYl8YUhzOnXNYUtKCI6yMD1XCjTIv5rC3mNue5xXqw9MN1KFN5ndYOHxeIotDQJG33HseqsjI+NqWmDLNTox5qVRdW9z3jp87ewDAHi7ig1s8JRTaPYX5sSxPLkBY2HXx8AvGCw9XEujogGRvA6vq3xQMps+LdMAV6zw2wuCdZFxx+w6oXM5Y+wAfUAP2YIZNX9kSG3jf1vLz/AH+Ixylj3uDve2NXptt8Gdle3KUvSbWo1u9YfiBmdr8euhCaaiiikZRKW06SsZDcr7gHxHgevI9MQ4YtEfaakltczCxKopkADsSbM7HkOlh4HHHKqq1oZPVJ7p/Z9fLwxrErLz7zRuAY7WRrXIuBboTfyJG18LskfC46fUe/seR1sWxlQCtQbEzI4ERY7m122NpAA2IvAl4ZI00L8YLki5uLqCu5BAPK9uVuWMlABZ7bhWDD8oetpPljIpQjs2nVFPs5WMDVJ6xRL7Kq2tcW26bY+ZkpUFL3ZrIpuDe+xJI2uBe9vEeOB1GkuBTnZtdtOk5hF5J8YFuukbXI0IBnZXmBijEd2KWsoLX0jwB52v0N/K2JWXS2mVlLHvdDYkefP6t8BaqIuCFNmvdT5jvL9mJPDteJLtvcIAVHRj2inr7D9WFalP4HPA118U87u6ThRAiRbgY1HKLGOe6cszrC2np3ByvtyNrnna3PA/O6puyXmCCCCDbcb+3/AI8sc6a+m5v13PM/uwIqZ9VxcncWBN/H9+EcPQGcR/lVmUhYDZRu0xmPuMxqwOCPl5qR6ER/7xbx7B7H8ndRcef78WVnuWEWCVliD3izNc+8XOKZ4CzKsp6kvRQCeUoV0FGbukrc2UgjcDe9t8OdRQ8R1BNqWOHUdyOzXn9OQn6sO1aT3GW/f7L57QqMa0hwPkD6qdmpzCOmmjRoqiKSN0ITWrC6lb2YspO/IAX6HDZwdxNlcmUQ0s9ZFGew7GVWkCONtLDcgjyOEel9H+ennWJEDztM+3s0La/vwLzz0fR07A1eYXkkN7LEXJ3GpizOOWoE9bb2OLUaTmSDHgpiKgqEET4wrV414wy008QSsgfs6mmchJFZtCTIzGwNzZQTt4YLVPFGTyyQytX0+qEsyfHKN2Uqbi++xOKYruAqH+TJK+nqJpdK3XUoUXDhWDLa+2/XBzgLKqJ6GmaWmikdu01M0asRaRwL3FzsLc+mGWUy4wka1TumyUezLjLLzntNMKmMwpTtG0oN0V3LEKW5ch7MNq8TZOKhqn4fTdo0axH49baVZmG1+d3bfzwP/kml7EwrBD2R7xjCLpvz5DboOmOacNZbpBNHTDbc9glvu4J3B4oIxQ4Llwxx1lnwnMCauJQ86sjO2kOogijJUtYHvRsNvI8iMb5nxXl1PS9hS1UMpllYELIHKiZ2kkawN/nNbwLLj7n9BS6ET4NTNotYSRKVjjudRXu2HK3gCQThU4oyel+DUjpTwQyNUQ9o8aKmhTquSRyUmw3PzhgWUSWg3AlGzkAEiJMD3qj3pV4ahkoqejpo4YiJAUuAuhbEGwALszFlFlBJPPC9mtVRSxUkaTMhppe2dlheYyzKbd6RjEWtaxJGra3S5gKaqqNQsUQqtAAea+mRHBUoYWDaNSWJCbbL0uLxKx9bLUadPwksJktbsqyPaZCPm6xaYA795vDAaznNZmaF1zoBhOa19GauTNA06xKqioTsfi2ljA7ORjqLC2sWGk3I2JIIwO4Kykx5gkt45UmnlmvqaMxrKjWsjqpk1WK7FhyIGxOF+CkaZhD2pjhdlec9OziDOWJ/MF3HQkW644SZtIxmqvgiBJmTSZQdSUyd2NIVB5BLFpOWxNiBfFKVbO2Tb8rtMl4kBS/S6sNFWMlNeNJlBliTZTJzDgche4BtsfbfCxTwAQsWJGtgZRq23JKI3l3rm9rkHqDZlTLlrKuFpJPhN6ZnuzC6kSBULaSbkC3P1tO9zfEw+j2EHU8rjvFn0G2u5vvcnkNtrHmccqVmMMFMU6T3iygZXkbS01TPIToSJwDcDWwjJAB8AAL2590DkSCH4NXy1Z9CP7zYNZ9XU0FBJFEEjjELqiC22pWF/EsST9ZwF/Bq+WrPoR/ebHMPVNQuO2ylan3cBXNxR+J1X6CT7jY82Meftx6T4o/Eqr9BJ9xsea25n24pifmC9N/Z39Kp1HoVl8T6HM5Y10qxC6gyn8h1N1dfBhc+0MwNwSMDsfAxHL3YW5hbtRrXtyvEgotLnsUbyTKWUTWWdImtq89t1YE2v52PM3DPR90P2gcP6t92t58x/i6YXszZ1kOo94je3QeH++DOTqqrYPc8xa/LxVbX9vW64Ye2GAzKw8LVFXEupBuUDXa4J2m5I6kbukrsSLWIHe7v8fVj40dhyvgZWVuptmVbPZfzR84nowY+3lgyj3sfysDc0tAK0KNVldzmt23t719eMgRDSK3MYjPKiSBDp0clPraTtcn68d6es7R2iItcd3zXT/DYD9oryF1UAdE5fN9lv+cFY0mcyQxeIp02sdRiS6Jj/Trby3BuCEVq6K9wO6ox1nUnQx56dL/naf4+7jtJP3AyoX1EWH0v492B0dUdSs9gsi778tJK3HssPbijQXeCYrmjSdGzoO8AAgAzEWJAtxvwUukSwZWtYgi5F7fQHIEnr7cdZSwQAk3W2kAd1RvcHqSbjf8A2xyadFkCX7x8Pmn1t/4+diQxCgs3Id44qSeGquyhTIIB+WxM6b38Fuj3AONcoTs5Jz+W1vYLFjb3H/DgVS5t3rM3Mrv0XxPK9+nhgtG+oow5amP2EftxR9ItkHQ/yi0cRRxeVzTJafX4Z8jPBERJse9pI5fu8cQjjo73xrgbRC0AFrfHzGX/ADcZgkKk+4Ur0HsBmLXbT8Q++35SeOLyjrLK7uy6VJub22H68Uf6DFBzFrgH4h+f0kwa9INVI2YU9MPk2XUoHWRndb+4Lt4XONcGGyvnDdFy4j4pnzFxDAWCubRIt1uehLGxJGxNth4jEbjfO4YuxghSOSGIFVQlgCQBqkJRgzamJAN+aOTckW14XV1op60/+HCyQm3zm2vfxB2wgSl5Zbbm50hQeQ6AdBtheQ58nb1/bTzVxLW9ff1VsUdQGymujBGkQ9oAG1aSxuyk23IYFf7HXmevo1dvgEQCg+vvbf1zy9n7TgBkEn82rUANmopGYnx1yOP2/Xh09ERUZXGWNu8/T844Yw7sv19UpjmZwB09EXXtrciOfkN/Z+rCpxVxBKGajSRogkZZ30E31bhR4Xta4ta5Nza2DPG3ECKI0hqAjKSXt3ri1tLKNzzvtyt54U6nP4CqmaORnKkMQhsb8wC5At7BffnjtatnBZHDp56HwlCw+G7oioXbHeT4gXE8wBzUTKqVy5RpJm1LZgJLeLlVIIv1JXxvz6n3qI2JQntEsAY3WxsOhDDf3gXwvjjNKcE00Gh7WDM1z7/nH68dY/SbVuLTQQTL4OP1G5Pvwq1lZpzMfB4Ra3vaOi06tbCVCGvo5midXQ65mZG+2t+Nk3ZY6mMLEAEF+6BsNuWkbA9cCM3oLymJjpSs0qrnlFVxj4iTrYOLxNbo2B2Xcc0qSazTvEfnKkpdWHsYc/DcfacNOeSUNVTCXtIzBIAQHYLyO4IJuCCPrGHw/vKeV4E/T3yWNVoto1i+jJZtmiYOxgwfDXgDIS3mFPNDTiKWNop6vuFD60cCWeY7fltpjF+YVvHHWVyzBrIhXy6DlccsLvA2ZUFLXVhnKCEo4iPeYX7RdIXSCT3b/VjOKuLqZu7Sj1vWbSe6PzdVjf7NvPbLfhzIa3QLWw9ZlNkZVLn4gggLCOQAnduyULcjqSoufacc8tzRqpyo1LpIJ1lrm/v/AFYTqWuGoaYde4OnxANwNgb77nxPltgxQZjXhi0VMdTksWZWN7E8iSBYctvDHTQYwSfqrnFVXWYI6JlzfKVaOVmJZkja1wTaynqcE/wavlqz6Ef3mws1s+dTxSNJoSLQ2oWiGwBuBsXva+Gb8Gr5as+hH95sEoltwCD0QHteDL58Vc3FH4nVfoJPuNjzW3M+3Ho/jGXTQVjeFNMfqjY48tQ5nqYWfryZP4+9geIY4mQvQdhYulSa5jjckRp9yETvj6MDI87T5/8Ahx2XMozvZv8AD/qwA03DZbtPHYep8rwUHzKN3lcgE3JA89I3+rHKipXaTStgw3N9rftwVirkVmYsbty/NuST16Fv8ONGzSHtA4VtlI5AX5W69N/swzndEAbLz1TCYXvO9fVEl8kSJib6Sdb9IGqH5lCscjBQbbWv4W+3BDh6ZtLA+oOfl+/Gs2ZRO0Z0N3Olv9/f7sb0+YR6+6GN79LfO1D53S7DHH5izKQi4VlClizVZVblkwBwO3MSYjgNrQMpKhu0BC3J20+N9rDw54iyIQSCNxscFJq7Q1lRQV2It4MT+3/CMcZK9jquAdRuR5gEftvgoJmYWZVpUgzI6qZBP+WwkX5zIAPjbWTUfxUN7aSF5eBt+1sLq1DDR+Ybj9eDEOdRttIp58vWH+LESIwrKCFOkMdhvdTy5/VgVOWzmF1p44sr913FQZRbgRcXiNBExbS3Aa1dUokkIu4P5Q6+Pt5/Xgrm1cYlGm923Vuq+387fAedYmLEa9z3VI+u5v7fqxPkqBOujs2XRbfVq0r/AMXxxwHwmLDX6LmHrVAKzA8Bzvki95cTETEi4kyLFBYJApBIBt0PXDisYQaRZQvhhbipYyWGr5vdPLvXHt23wxdtGx0hlYnpcYriDmiEz2HRdSD80XiLjW4I47N0/K6Xx8xtY+J+rHOSVRzdR/aXCwXoTa5W9sZjl8Ji/wDMX+9j7jsHghyziPMLp6IM0jpq8vIbAxMo8yWSw+zBXP6qR8wFZZTDCo7LcWkAsWtY+LkX5XHkcCPRLAr1rq4BUwvcH2riXxVvUOU1MJI9KlmuSy94db2O/PxHu1SJbB0XziS0SjNbmEMmXfBk+L7JY+61wSFc6gRe52Goj8734A5hXUkTqYaIMCwf12AVmXkrXLEeRsL9Da+GfiXOlu+pQwDm5tchNIa1/It79hgXkWVU3bRmVQxlDSEEnTHEgu1xfvEk2GM6lWDGkkc1q1aBMZSLfTgfYRjIjBJl9fIAEZKV4re1GcDzIFrnxc4z0dcYZZTZYsFVPpfW5KhHY2JuPVUgfXg1mNHG+Xyslh2kEzsB+WyMbHw0+r7FAHhiv/RtkFNVRyNKis6MOZPqn829uY52/Zh5xFJgJ9ykTSNd4E+wmOu4+yZD8UtQ3miBftLg/ZhXzbiumqW+IoHLHr2lyx+iqftxZnEPD8VJS3paaAswsW7NdVrfN254Rcsr2imbVpkgCF2+bIpAv3drXuCLEnle4GBisToF1uCGpNuQ/dLkfDeZy2K0UqhvV1oVv7C9r8+eNaHhmulrGoToinQXYORYbA80DdGHLHoCeRuyp7qVYRqSrW1A2HOxIvtvYkYQaAE8UVXnH/8AbjwGviHMpPeNQEvTaC8AoPS+h6dvlKtFP5qM36yuOlL6MKb500rEX5aVGw67MQLjn7ueLQiL62+M2DEabDcAeNr+WAuYV0ELAdse6bsL2XwtbxA8fAYyqeJxdUw0kngAJ8ABdafdUKYJdEcTp5m35UPL/RrlQ0loWfVq9aR9rEWJsQOXj44jNklDFI8Rgp1IUhW7K51XAFhu2phc7X5iwxzbjWOM3Vu1OmwCi+9+fTc7YDGvqJ5zKFftDysd1FrWAUC2225Jw23s/FP/AFnQObpv4Zo6m/IpY4ug0/3Yn/p0/wC6AfA+KZROULt2fZC99IGw6+qOnPbCdVcSKNoioCk2LFRufAE3Ps3xLraaSIHtV0qRYhiWuOVrMet7csKmaa2ISJQCeQVRsPMgXw5TwdNokwT0J9ShuxT3RlkDqB6BTI80q5EqGBRo9Lqwa1r6eQ3U3AbbnuORw1/g1fLVn0I/vNisswJCKCLMAwcefQ7773O3Qg4s38Gr5as+hH95sMNptZ8oHgguqOfrNuKuDjRiMvrSOfwaa3/ptjy2YRqv1vvj1FxwbZbXEcxTTf5TY8k0dawkuxuCe9fFKrSbhaHZ+Ip0zlfuR0Gt/qudRAi8nufD/fliyPRVw5JVUzulJSzhZiC0zhW9RO6PiX7u5PtPS29Xldzi9PQ1NFHkddJNH2sSSyNIlvWRYoyRvz2vggSNUgukNjkJ+/7DkF0qeA6iN42+AULanZdIkXfU3ai96UABVjKDnsx54h5nwJUU9M0slFREQIsspEg1OIm7R7D4MFAdVZdPLcdBY2HW18VJV5fQRU4WOUyvGyEBU7ON2YBQN76/H52K39LnDMsS1VYMzdgzj+a3OyuwBX5U7C97abWGOoaMU3o3nj5UNC+6GzTX9WR3POk+cJNBHKyJ+SMIz0ZXMBQS5dEs7hIx8aUUkBrSAxoB3gQb2Pq9OQsvJ62Q5XlMhkYtJUQLIxYksNb8yTc3a2K99PVQ8ebI6OyMsCaWUkEd5+RG4xFBbRM03ormI/EqPUTz+Ey7cunYC+1+vMnyGFSn9EWYVeqaNYKdC7qInkYlCjshG0ZuLqbHqLYud6pmrcsO4ElNOSL9bU7C/iRvv7ccuLMhqKugeClk7GUzswcsy7ds5bdbne5NsRRULX+jWuhroKBmhMs6lkIZilhqJudFx6h6YzNPR5W09bBQs0RlqBdGVmKc2BBJQG403NgeYw5eijJ50z2aOplM70kTgOWZgGJVdi242dtvbib6caoTUtDmNNIy6ZZI1dDY735Ebixhbl4nEXQSNEAf0H5rb5SlP/zH/wD1YRhkVR31buFGZXViQQyncEWx6frJn/lGiXU2k09QzLfZiDAASORI1G3tOKJz6Zv5TzBL90TuR7Sx/ZgFcuYzM3ZanZNOliMUKVeSHAix31vygHxhKsOTTKwsyg7kb/k2v0/Oxldksg1SFowOZAJ2+zE2uqXFXEoY222+nz+zG3EkzKgANtTMp8wCLYXFWqXMuL8ua26uBwLaFcw6Kbo1/wA0AceJg6WSzfp08PPBSnpQtgba/A4Fo5G42PjjEJBBHMYcc0leZw1ZlI5i2T6Dlz8ojmmFadPyE/j3YzEP+VX/ACB9YxmFcj/ZW9/WYXj/AOB/CkcEysKmwNtalT7Lgn9WDPFFSupAxIJB/snle/Mc+fl7wF4JP85v4Ix/VjnntSXmck7L3R7uf24cK8rElSRnEliHswawPmACPYT/AB54OZXnLldKRoCyLEdzcKDvbY7tq35AAeWEJXI5G2GymmpytGsJYzdovaDvddnvfum9ha3QdMAqUmSPhn08U03EVIidk/zZhoo2iXZtDb9WDAk6gNrm5v8AqwM9DoVYHcsflittrW0ob8r/AG2xDzKfdlHn15Xws8N5m0cDIt7lyQBz9VR+zBcSM9MRyTFKBUHQq6eNq3s41IGrY2F/G2ETJ37aZFiWIOWuzMxDNa1wtjtudjY4EycXTSx9jOpYgWVl5/VjtlddFFEHPaGTV6pVdLBbFSSwJUjppsfPCzaZ3TBqhrbH+VcOYTFnNzcju38bf73xWFHVInEFQ0khRdFrgXPqRgADzxKynjeoqqvSFQowNwvzABz1Xvcadwdu+OVxdS4gqpkzOqMSszMukgLqOkolzbp7cFYCwnosbJNinbivPaVadzR1U3bXFxpXZetgLG/LlitROrMNRmkYn53cFyf7WJsAk06TBYm+tyVXXcGwsCLXJG4N9uYxFpaZncRpTOJW2ULrJB8dBJ5c9zbbBaTWgHJvr+6JiXvc8d4ZIFpTHkWcUUL3lXugHYaQzeF25gc7258sMsHpIoYSTDAB5i5P6iB9uKuOVVQLgwy3Q96yPt06Dy64h3ubb38Ot/Zq/Ziwg6HyQiOKb+L+MfhjiQ3G/LcAACw57nEngSETrM9tTqbqACT80DlyFzuel8A8thopYexqFkp5gSVqLEob8lkWwsB+UL899sdeEcxjp2ZJKhqdhqtJGNYswtbusL+IIJvf3is7cERusqRx1R6BFIbBm7WNjzu0RCk+03G/W18Nv4NXy1Z9CP7zYTeIJkqAukSCngjYRh7B3Y3LSP4Fm+aOgAw5fg1fLVn0I/vNiNcDYbK1RhbBO6t/jr+ja7+qzf5TY8e6cew+NFBy+tB5Gmmv/wCm2PKtNRCM6/7vl/vjj3hqPhMK+ubaDU8AhJXmMWv6Oc6posjzKGSeJJHE2hHkVWfVAFGlSbtci23XFWToQSbGxJxdfoTgQ5ZOSyxu1WEWQxq5BZYgosw5Etb+1iwQarcrsvBFsp4poZ4MonlqoFmhYiQPKqst4JYnJBN1BcK1zYEe7APjThjJaqaoqjmsXayAuESWIrqC2ABv1sMO2Z1spirXy2njlqIp1h0PGALqqa+bLcANcG/XALg/i2rmpKqSWKBJoqyGHSqd0dpNHG4I1HcazyPPxx1CRHssrSloaUZpTBaSeOYMZorydkxax7+1yeY8MVn6R6ykzDPIkWcGA9lC8qldI7xuVY90gaufLY4t/P6WqiilGW0tNJL8JuySqAulowzMO8veLkHn844FZFw/T5rl9FPUxxq/amoOhQAfjXZk3uezIIBF/DEURefNcr+EU038o0oNMkiBO3i31hBv3rgjs/tOA2e1uVZpQdi2YwwI8zuC0iKx0yvbuuQQDz36WwzVNVDTpUyF4YY0mTWzpdQDHDcWBWxOoAHxPI8sK/CPFsVXmtVSwinkpBF2yOsZDFh2SsCTsVBZunhviKIPwhFl2S/Dpoq6GpAgRl+NjBeQGY9mpVjudC7Wv3sdm4hos9y1oZTHREVCKEMqE81OpdQTmGfa3zTiFwXx3NV0+YVMtNSa6WAPHpiIBIDkBruTbboRhpjq2adaNooOzfK+31iMBzLcIbG9tNje1r3PPEURqpqKI1ENW1dCPg8ciW7RApEmkknvdOzGPPk2YpU5jWzx30SF2W+xKlxY26XG9seiajhqFqynq1jUNGjxuLCxRxcG3kwI/ttjztPb+UK0KLBWdQOg0vbawFhcHpgGJ/Sd73Wp2J/j6XU/+rkLrx/PY7+KfqF/tvjfirlH9J/+3HzMB/PIf7H7Mb8Sr8WnkxH2DCrP1KfT8hb2Ib/umNH/ADJ+rD/CX0iZuQvbwxvFCxNrH6sawuwYFed9sGeyJ31b4de8tXncJhm1wTeRrzH580JaCxItjMErr+Wv97GYpnTX9HT4fUfhcuG5lSbUzBVCm9za/UD3kDEmqiha5Ei6iSb3G5O+F/GYu5hJmVlMqBrcpaCpDKPEfXg1w40aTJI0iKEDtuRuVRrD2k7AeJwu4zFnNkQqNMJ2GYxsDqlS92HrDlqa32Wxy4L+DaJDK0YfULK8mgEW6eO+E7GYj25mZdEVlctIMaJ6zDNqK0gVAkguAyMCBta4ILBvG/P2YhUFDBKQZqwCIljoMgv62xIvZbqF89vLCljMVDIEAlcfWzmSArvynMskgjKh0i3uSshfUfaLnp6p2GEubNYBm8ksMiiFtKh2J02KoDcm5tcH6sImMxzugQQTMqjX5XZgrvkkyoSR6qmBwxswEgC2O25DbWvf3b+RakzvK4Z1EMtIkYt3klVLXFjyax+rHnrGYXODtAdFwfLbXdGOJJMkTYi/rtEK/c64joVmZ4KinJbYHWty1rEu5bZNhtsWIO4HOPl+e0oS1TWUtQxvcv2dvADZRsDbn4k8gMUVjMF/p2gQEE1CdVZ2aw5Q0hkKRdBaGdVVj1OkE23222IsfM8c1NAio9K8QUjdda6w3mOY9u4Pl1rfGYjqGbUolOv3ZkD6pgr8yVtQB2sQN8WP+DV8tWfQj+82KYxc/wCDV8tWfQj+82DNYGiAhPeXuLirf43/AKOrb8vg01//AE2x5XgrQzBUDc/738Lj1Px1/Rtd/VZv8psePVa2OPYHJnCYt2HNtCRPh6KVNUOCRcgXI0g4duEuMYaPKp4Lk1Jqop4l0mx7N4X3bkPkjhAdyST1JxNy6o0mxUMp3seQI5HE+UWC5mFaoA90AmxN48B9tOCu+t40yaojrENVUxrPKkxaGN1ddMcSGx0EAExb38TgXw9xJkFJDLAtTVssk8cxdku2qJ0kXfQObJY7XsTy54rSnW/aIO6D4eerAOZLEjwxxj81kTFYI0GNdMzPmD5q7OIuN8kzOJ4qmWphAqO1Ts17x0p2YJOlhYi5tzG2Amf8dUqUtJR0M0wSJnjkdlALwObEctyV8ANxiqcZgiRV18fekHL6vL66GGRu0mljZFMbDUqiC5JtYfJnr83zwo+hziGmoKyWWpk7NGp3RTpZruXjIFlBPJTv5YQsbXxFFZfoxzfLIaOshq3mV6n4thGha0QXYg6TZtTtzvyXbDbBx5loMczfCe3jpPg3yZ0bi7E9fWVd/Dpik8vkZZFseZt7sHpZLMV6HAalQtMQtbB9n0q9Muc4ggxoNxZWaPS9SLmfahpDSSUyxvdDdZUeRgQt+Vn0m3iPDFafy3TmWZ+TSSyPq0HkzEruO915YX69owdksfEHb6v98QcdcxtVkFBw+Jqdn1y6mWuItoSP/lNT5nTtIj6h3A++g9dOn5vtxzzHNad42Uaiend5H8rC6u5Ax0qogrEDobYEMMwEXNufOeCfd25in03y1kOsbHdsf6uAWU0xS5AF/PHePMZA2oknxGIYxqMMFoOoWOzEVaYAa4gDSDH8+KM/DI/HGYE6sfcD7oJz/aVTg3y/df/Z',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTl2p20nSWGyrBRR_A-RvEGi3uhE7QL8gaisQ&usqp=CAU',
    'https://img.freepik.com/free-photo/shop-clothing-clothes-shop-hanger-modern-shop-boutique_1150-8886.jpg?w=2000'
  ];

  List lis =[
    "https://ichef.bbci.co.uk/news/976/cpsprodpb/13729/production/_112375697_1331db7a-17c0-4401-8cac-6a2309ff49b6.jpg",
    "https://image.api.playstation.com/vulcan/img/rnd/202010/2217/p3pYq0QxntZQREXRVdAzmn1w.png",
    "https://rukminim2.flixcart.com/image/850/1000/k63xle80/code-in-the-box-game/7/y/u/pc-red-dead-redemption-2-pc-standard-edition-original-imafzmkyques8mxp.jpeg?q=90",
    "https://store-images.s-microsoft.com/image/apps.58752.68182501197884443.ac728a87-7bc1-4a0d-8bc6-0712072da93c.0cf58754-9802-46f8-8557-8d3ff32a627a?q=90&w=480&h=270",
    "https://cdn.akamai.steamstatic.com/steam/apps/271590/capsule_616x353.jpg?t=1678296348",
    "https://cdn1.smartprix.com/rx-i1ovwUq99-w420-h420/xiaomi-redmi-note-11.jpg",
    "data:image/jpeg;base64,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",
    "https://cdn.akamai.steamstatic.com/steam/apps/243470/capsule_616x353.jpg?t=1680017857",
  ];


  final categories = [
    "Great Indian Sale","Top Deals","Top Picks","Today Great Deals","August Makers","Your Choice",
  ];


  Future<List<Images>>FetchImage()async{

    var resp = await http.get(Uri.parse("https://fakestoreapi.com/products"));

    var data =  jsonDecode(resp.body);

    return (data as List).map((e) => Images.fromJson(e)).toList();

  }
  Future<List<Shoes>>FetchShoes()async{

    var resp = await rootBundle.rootBundle.loadString("assets/shoes.json");

    var data =  jsonDecode(resp);

    return (data as List).map((e) => Shoes.fromJson(e)).toList();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Container(
          height: 40,
          width: 300,
          child: TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Search eValy.in",
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.mic,color: Colors.white,),
        ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.lens_outlined,color: Colors.white,),
          )],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2,
                  enlargeCenterPage: true,
                ),
               itemCount:imgList.length ,
                itemBuilder: (BuildContext context ,index,pageviewindex){
                  return Container(
                  margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                       borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                      Image.network(imgList[index], fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                       bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                      gradient: LinearGradient(
                      colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      ),
                      ),
                          padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                          child: Text(categories[index],
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          ),
              ),
              ),
              ),
              ],
              )),
              );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Top Men Shoes",style: SubHeading,),
            ),
            FutureBuilder<List<Shoes>>(
              future: FetchShoes(),
              builder: (context , snapshot){
                if(snapshot.hasData){
                  return SizedBox(
                    height: 180,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (BuildContext con,index)
                        {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context)=>Details1(
                                        snapshot.data![index].id.toString(),
                                        snapshot.data![index].name.toString(),
                                        snapshot.data![index].imageUrl.toString(),
                                        snapshot.data![index].description.toString(),
                                        snapshot.data![index].price.toString(),
                                        snapshot.data![index].oldPrice.toString(),
                                      )));
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 120,
                                    width: 190,
                                    decoration: BoxDecoration
                                      (
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(snapshot.data![index].imageUrl.toString()),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 190,
                                  child: Center(child: Text(snapshot.data![index].name.toString(),
                                    style: norBig,
                                  )),
                                )
                              ],
                            ),
                          );
                        }
                    ),
                  );
                }
                else if (snapshot.hasError) {
                  return Column(
                      children :[
                        const Icon(Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Error: ${snapshot.error}'),
                        ),
                      ]
                  );
                }
                else {
                  return Padding(
                    padding: EdgeInsets.only(top: 48.0,left: 150),
                    child: Column(
                        children :[
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text('Awaiting result...'),
                          ),
                        ]
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Top Trending Games",style: SubHeading,),
                  Spacer(),
                  ElevatedButton(
                      onPressed: tap, child: isGrid ?Icon(Icons.grid_3x3):Icon(Icons.list)),
                ],
              ),
            ),
            SizedBox(height: 10,),

            GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Youtube()));
                },
                child: isGrid? buildList(): buildGrid()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Now or Never Sales",style: SubHeading,)),
            ),
            FutureBuilder< List<Images> >(
              future: FetchImage(),
              builder: (context , snapshot){
                if(snapshot.hasData){
                  return Container(
                    height: 2600,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context , index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => Details(
                                            snapshot.data![index].id.toString(),
                                            snapshot.data![index].image.toString(),
                                            snapshot.data![index].description.toString(),
                                            snapshot.data![index].price.toString(),
                                            snapshot.data![index].title.toString(),
                                            snapshot.data![index].rating!.rate.toString()
                                        ) ));
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 100,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              snapshot.data![index].image.toString()),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 100,
                                      width: 260,
                                      child: ListTile(
                                        title: Text(snapshot.data![index].title.toString()),
                                        subtitle: Text(snapshot.data![index].rating!.rate.toString()),
                                        trailing: Text("\$ ${snapshot.data![index].price.toString()}"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                }
                else if (snapshot.hasError) {
                  return Column(
                      children :[
                        const Icon(Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Error: ${snapshot.error}'),
                        ),
                      ]
                  );
                }
                else {
                  return Padding(
                    padding: EdgeInsets.only(top: 48.0,left: 150),
                    child: Column(
                        children :[
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text('Awaiting result...'),
                          ),
                        ]
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding buildGrid(){

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 450,
        child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio:  2.8/2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 16,
            ),
            itemCount: lis.length,
            itemBuilder: (BuildContext con,index)  {
              return Container(
                height: 200,
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      width: 190,
                      decoration: BoxDecoration
                        (
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(lis[index]),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        height: 30,
                        width: 160,
                        decoration: const BoxDecoration
                          (
                          shape: BoxShape.rectangle,
                        ),
                        child: Center(child:
                        Text("Games",
                          style: TextStyle(color: Colors.black,fontSize: 14),
                        )),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  Padding buildList(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 180,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (BuildContext con,index)
            {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 120,
                      width: 190,
                      decoration: BoxDecoration
                        (
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(lis[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: 190,
                    child: Center(child: Text("Friends",
                      style: norBig,
                    )),
                  )
                ],
              );
            }
        ),
      ),
    );
  }

  void tap(){
    setState(() {
      if(isGrid==true){
        isGrid = false;
      }
      else isGrid=true;
    });

  }
}
