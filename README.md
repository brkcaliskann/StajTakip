# Staj Takip Sistemi

# Çalışma Amacı

<div align="justify">
Bu çalışmada yükseköğretim kurumlarındaki öğrencilerin eğitim öğretim süreleri içerisinde akademik kariyer süreçleri devam ederken mesleklerinin kurallarını ve işleyişlerini bizzat iş dünyasında öğrenmek adına gerçekleştirmiş oldukları staj programları kapsamında öğrenciler ve akademik birim arasındaki staj sürecinin bir web projesi çatısı altında birleştirilip yapılan işlemlerin bu sistem üzerinden gerçekleştirilmesi amaçlanmıştır. Geliştirilmiş olan çalışma kapsamında yükseköğretim kurumlarındaki staj süreci içerisinde bizzat elden teslim gerektiren belgeler için oluşturulmuş sistemin kullanılması ile staj sürecinin hızlandırılması, basitleştirilmesi ve takibinin yönetilebilmesinin kolaylaştırılması hedeflenmiştir.
</div><br>

Aşağıdaki link üzerinden proje içeriğine ait oluşturulmuş gerekli bilgilendirme metnine ulaşabilirsiniz.
  
Proje bilgilendirme dökümanına ulaşmak için [tıklayınız](https://drive.google.com/file/d/1mdD3xwxdmLhCksvkNVG09kgKsG9f7r1y/view?usp=sharing).

# Çalışma İçeriği

<div align="justify">
Geliştirilmiş olan sistem <em>"Bilecik Şeyh Edebali Üniversitesi Bilgisayar Mühendisliği Bölümünün"</em> staj yönergesi doğrultusunda tasarlanmış ve staj uygulanması, 1.  Zorunlu 20 iş günü olan <b><I>"Staj 1"</I></b> ve 2. Zorunlu 20 iş günü olan <b><I>"Staj 2"</I></b> dönemlerini kapsayarak toplam 40 iş günü olacak şekilde tasarlanmıştır. Bu doğrultuda sistem temel olarak 3 alt projeye bölünmüş ve tek web projesi çatısı altında birleştirilmiştir. Aşağıda program ilk çalıştırıldığı anda <em>"StajTakip"</em> adlı alt projesindeki <em>"https://localhost:44306"</em> tarayıcısında bulunan ana sayfaya ait ekran çıktısı görülmektedir.
</div>
</br>

![Ekran görüntüsü 2022-05-07 140737](https://user-images.githubusercontent.com/85406429/167251698-af196324-f29a-4610-b0fd-9033ddd46e26.png)

<div align="justify">
Kullanıcılar ana sayfa üzerinden istenilen staj dönemine, bağlantı linkini kullanarak giriş yapabilmektedirler. Geliştirilen sistemde <b><I>"Staj 1"</I></b> ve <b><I>"Staj 2"</I></b> dönemlerine ait kayıtlar farklı veritabanlarında saklanırken kullanıcı girişleri ise farklı yönlendirmeler ile yapılmaktadır. Staj 1 dönemine giriş yapanlar için proje içerisinde oluşturulmuş olan <b><I>"Staj 1"</I></b> alt projesi, Staj 2 dönemine giriş yapan kullanıcılar için ise <b><I>"Staj 2"</I></b> alt projesi çalışmaktadır. Aşağıda geliştirilen proje üzerinde Staj 1 ve Staj 2 dönemlerine ait verilerin kullanıcının seçim durumuna göre kaydedildiği içerikleri birbirlerinin aynısı olan SQL Server üzerinde oluşturulmuş ilişkisel veritabanı diyagram şeması görülmektedir.
</div>
</br>

![resim5](https://user-images.githubusercontent.com/85406429/167255394-1a5cefe8-8057-423e-8ded-5d48e6456860.png) ![resim7](https://user-images.githubusercontent.com/85406429/167255341-be09087f-2981-493b-abf9-40321da82976.png)

Geliştirilmiş olan <em>"Staj Takip Sistemi"</em> projesi aşağıda verilen özellikler dahilinde tasarlanmıştır.





