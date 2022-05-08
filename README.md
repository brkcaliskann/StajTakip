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

<div align="justify">
  
Geliştirilmiş olan <em>"Staj Takip Sistemi"</em> projesi aşağıda verilen özellikleri içermektedir.<br>

1. ***Kullanıcı Paneli*** <br>
   İlgili staj dönemine ait numara ve şifre bilgisi ile giriş yapan öğrenciler kullanıcı paneli üzerinden; 
   
   - Üyelik bilgilerini güncelleme,
   - Şifremi unuttum seçeneği ile sistemde kayıtlı mail adresine gönderilen aktivasyon kodu ile şifre resetleme,
   - Staj başvurusunda bulunma<em>(staj belgelerini sistem üzerinden yükleme)</em>,
   - Staj başlangıç formunu doldurma<em>(iş yeri hakkında ve staj başlangıç ve bitiş tarihleri ile ilgili gerekli bilgileri doldurma. Sistem kullanıcının hafta sonu çalışma seçeneğine bağlı staj başlangıç ve bitiş tarihleri arasında sene içerisindeki belirtilmiş resmi tatiller haricindeki toplam çalışma günü hesaplanmaktadır.)</em>,
   - Yapılan başvuruları görüntüleme,
   - Başvuruları değerlendiren yetkili kişi tarafından yapılan geri bildirimlere <em>(dosya gönderim veya mesajlara)</em> ulaşabilme, 
   - Sistem üzerinde yer alan <em>"CKEDITOR"</em> aracılığıyla gün gün olacak şekilde staj defterini hazırlayabilme<em>(ilgili staj günlükleri oluşturulduktan sonra  güncelleme ve silme işlemlerini de gerçekleştirebilme)</em>,
   - Oluşturulan staj defterini pdf olarak kaydedilme,
   - Tamamlanmış defterleri sistem üzerinden yükleyebilme,
  
   işlemlerini gerçekleştirilebilmektedir. Aşağıda kullanıcı paneline ait örnek görseller yer almaktadır.

![resim14](https://user-images.githubusercontent.com/85406429/167303454-d72df8be-7744-4c69-91b0-e979c053b984.png) ![Ekran görüntüsü 2022-05-08 181951](https://user-images.githubusercontent.com/85406429/167303413-21529ccf-e837-40c5-8df7-e2c799c821f6.png)

![resim17](https://user-images.githubusercontent.com/85406429/167303692-dafd05a3-96b1-4f73-a271-b9dafe87166e.png) ![Resim1](https://user-images.githubusercontent.com/85406429/167303978-256f3300-be10-4cef-8c98-e48c02ba72ce.png)
   
![resim25](https://user-images.githubusercontent.com/85406429/167303767-31d28002-06f6-44f2-b264-440dc25d4253.png) ![resim26](https://user-images.githubusercontent.com/85406429/167303787-5963d6e1-2635-4405-ac7f-e34ba99f2479.png)

![Ekran görüntüsü 2022-05-08 184650](https://user-images.githubusercontent.com/85406429/167304078-b8bdff5d-8c1b-4599-97da-3055ed8656d0.png)  
  
![Ekran görüntüsü 2022-05-08 182350](https://user-images.githubusercontent.com/85406429/167303834-3e9a586f-42cb-4056-a803-752781110f55.png)

![Ekran görüntüsü 2022-05-08 182528](https://user-images.githubusercontent.com/85406429/167303874-34d45faf-342e-4eca-91d7-74f69659baa3.png) ![Ekran görüntüsü 2022-05-08 182618](https://user-images.githubusercontent.com/85406429/167303888-fe65d05d-962e-4cf3-a00f-6e20adc118e0.png)



  


 
  
</div>





