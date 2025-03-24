Açıklama:
Bu proje, Lex ve Yacc kullanılarak geliştirilmiş temel bir hesap makinesidir. Kullanıcıdan alınan aritmetik ifadeleri analiz eder ve hesaplama sonuçlarını ekrana yazdırır.

Kodun İşleyişi:
- Lex dosyası (calculator.l) kullanıcı tarafından girilen ifadeyi karakter karakter okuyarak, sayılar, operatörler (+, -, *, /, ^), parantezler gibi temel öğelere (token) ayırır ve bunları Yacc'a iletir.
- Yacc dosyası (calculator.y), Lex'ten gelen bu tokenleri alır ve tanımlanan dilbilgisi (grammar) kurallarıyla ifadeyi değerlendirir. Yacc ifadeyi ayrıştırırken, operatör önceliklerini (çarpma ve bölme, toplama, çıkarma ve üs alma, parantez içi işlemler) doğru bir şekilde uygulayarak aritmetik işlemleri gerçekleştirir.
- İfade ayrıştırıldıktan ve değerlendirildikten sonra sonuç hesaplanır ve ekrana yazdırılır.

işlemler:
    + -> toplama
    - -> çıkarma
    * -> çarpma
    / -> bölme
    ^ -> üs alma

Dizayn Adımları ve Implementasyon Detayları:
1. Lex'in Tanımlanması:
   - Lex dosyası (calculator.l) içerisinde sayıların, operatörlerin ve parantezlerin tanımları yapılmıştır.
   - Her tanımlanan token Yacc için benzersiz bir kod döndürür.

2. Yacc'ın Dilbilgisi Kuralları:
   - Yacc dosyası (calculator.y), matematiksel ifadeleri ayrıştırmak için dilbilgisi kurallarını belirler.
   - Bu kurallar aritmetik ifadelerin doğru şekilde yorumlanmasını sağlar.
   - Yacc, operatörlerin önceliklerini ve parantez içi önceliklendirmeleri açıkça tanımlar.

3. İşlemlerin Gerçekleştirilmesi:
   - Ayrıştırma işlemi tamamlandıktan sonra, Yacc ilgili işlemleri hemen gerçekleştirir ve sonucu döndürür.
   - Hesaplanan sonuç ekrana basılır.

Dosyalar:
    - calculator.l: Lex kaynak dosyası. Bu dosya ifadeleri tokenlere böler.
    - calculator.y: Yacc kaynak dosyası. Bu dosya tokenleri alıp aritmetik işlemleri gerçekleştirir.

Derleme Adımları:
1. Lex dosyasını derleyin:

    for linux:
        lex calculator.l
    for windows:
        flex calculator.l

2. Yacc dosyasını derleyin:

    for linux:
        yacc -d calculator.y
    for windows:
        bison -dy calculator.l

3. Oluşturulan kaynak kodlarını derleyip çalıştırmak için aşağıdaki komutları kullanın:

    for linux:
        gcc lex.yy.c y.tab.c -o calculator
        ./calculator
    for windows:
        gcc lex.yy.c y.tab.c -o calculator.exe
        calculator.exe

Kullanım Örneği:
Program çalıştırıldıktan sonra, aşağıdaki gibi aritmetik ifadeler girebilirsiniz:
3 + 4 * (2 - 1)
Ans: 7

Programdan çıkmak için Ctrl+C sinyalini kullanabilirsiniz.

Yapılan testler:
    3+5
    Ans: 8.000000

    (1+2)*4
    Ans: 12.000000

    (3 + 5) * (2 - 1) / 4
    Ans: 2.000000

    3^2
    Ans: 9.000000

    10/(5-5) 
    Hata: DIVIDE by 0 exeption

    1+
    Hata: syntax error

    a+3
    Hata: Unvalid character

Demir Doruk Dilek
24/03/2025