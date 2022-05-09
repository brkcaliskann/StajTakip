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
   İlgili staj dönemine numara ve şifre bilgisi ile giriş yapan öğrenciler kullanıcı paneli üzerinden; 
   
   - Üyelik bilgilerini güncelleme,
   - Şifremi unuttum seçeneği ile sistemde kayıtlı mail adresine gönderilen aktivasyon kodu ile şifre resetleme,
   - Staj başvurusunda bulunma<em>(staj belgelerini sistem üzerinden yükleme)</em>,
   - Staj başlangıç formunu doldurma<em>(iş yeri hakkında ve staj başlangıç ve bitiş tarihleri ile ilgili gerekli bilgileri doldurma. Sistem kullanıcının hafta sonu çalışma seçeneğine bağlı staj başlangıç ve bitiş tarihleri arasında sene içerisindeki belirtilmiş resmi tatiller haricindeki toplam çalışma günü hesaplanmaktadır.)</em>,
   - Yapılan başvuruları görüntüleme,
   - Başvuruları değerlendiren yetkili kişi tarafından yapılan geri bildirimlere <em>(dosya gönderim veya mesajlara)</em> ulaşabilme, 
   - Sistem üzerinde yer alan <em>"CKEDITOR"</em> aracılığıyla gün gün olacak şekilde staj defterini hazırlayabilme<em>(ilgili staj günlükleri oluşturulduktan sonra  güncelleme ve silme işlemlerini de gerçekleştirebilme)</em>,
   - Oluşturulan staj defterini pdf olarak kaydedilme,
   - Tamamlanmış defterleri sistem üzerinden yükleyebilme,
  
   işlemlerini gerçekleştirilebilmektedir. Aşağıda kullanıcı paneline ait örnek bazı görseller yer almaktadır.

![resim14](https://user-images.githubusercontent.com/85406429/167303454-d72df8be-7744-4c69-91b0-e979c053b984.png) ![Ekran görüntüsü 2022-05-08 181951](https://user-images.githubusercontent.com/85406429/167303413-21529ccf-e837-40c5-8df7-e2c799c821f6.png)

![resim17](https://user-images.githubusercontent.com/85406429/167303692-dafd05a3-96b1-4f73-a271-b9dafe87166e.png) ![Resim1](https://user-images.githubusercontent.com/85406429/167303978-256f3300-be10-4cef-8c98-e48c02ba72ce.png)
   
![resim25](https://user-images.githubusercontent.com/85406429/167303767-31d28002-06f6-44f2-b264-440dc25d4253.png) ![resim26](https://user-images.githubusercontent.com/85406429/167303787-5963d6e1-2635-4405-ac7f-e34ba99f2479.png)

![Ekran görüntüsü 2022-05-08 184650](https://user-images.githubusercontent.com/85406429/167304078-b8bdff5d-8c1b-4599-97da-3055ed8656d0.png)  
  
![Ekran görüntüsü 2022-05-08 182350](https://user-images.githubusercontent.com/85406429/167303834-3e9a586f-42cb-4056-a803-752781110f55.png)

![Ekran görüntüsü 2022-05-08 182528](https://user-images.githubusercontent.com/85406429/167303874-34d45faf-342e-4eca-91d7-74f69659baa3.png) ![Ekran görüntüsü 2022-05-08 182618](https://user-images.githubusercontent.com/85406429/167303888-fe65d05d-962e-4cf3-a00f-6e20adc118e0.png)

2. ***Admin Paneli*** <br>
   İlgili staj dönemine mail ve şifre bilgisi ile giriş yapan yetkili kullanıcı admin panel üzerinden;
    
    - Staj başvurularını değerlendirme,
    - Kullanıcılara geri bildirim <em>(dosya,mesaj veya ikiside)</em> yapılabilmesi,
    - İlgili staj dönemlerini kullanıcılara açıp-kapatabilme kontrolü,
    - Sene içerisindeki resmi tatil günlerini belirleme,
    - Staj başvurusu onaylanan öğrencilerin staj süresince gün gün hazırlamış oldukları defterlerin kontrolünü gerçekleştirebildiği, 
    - Sistem üzerinden kayıtlı kullanıcıların yetkilerini düzenleyebilme,
    - Staj başlangıç formlarının, başvurusu onaylananların ve staj dönemlerini başarıyla tamamlayan öğrencilerin listesine ulaşabilip excel formatında çıktı alabilme,
    - Sistem üzerinden öğrenciler tarafından gönderilmiş defterlere ulaşılabildiği,
  
   bölümlerden oluşmaktadır. Aşağıda admin panele ait örnek bazı görseller yer almaktadır.
  
   ![resim35](https://user-images.githubusercontent.com/85406429/167372578-09468407-2025-446c-9881-7e0f202f91a5.png) ![resim36](https://user-images.githubusercontent.com/85406429/167372097-d201bf9c-b811-4040-993e-9ce74cb2561c.png)

   ![resim37](https://user-images.githubusercontent.com/85406429/167372848-fd71631b-9e1b-4c76-a714-45aa63346edc.png)
  
   ![resim38](https://user-images.githubusercontent.com/85406429/167373009-22d19513-0ea7-4b96-bd8f-bc25237014c8.png)
   
   ![resim40](https://user-images.githubusercontent.com/85406429/167373411-3476d8dd-f3d8-4d95-a635-f5d09900beac.png) ![resim41](https://user-images.githubusercontent.com/85406429/167373201-d92a5244-d16d-49e7-8704-2d8a085d5b48.png)

   ![resim42](https://user-images.githubusercontent.com/85406429/167373726-53697c60-6f4e-4038-b9fc-b480275cf800.png) ![resim47](https://user-images.githubusercontent.com/85406429/167373749-4cd1a81c-b345-4bb9-a773-60874facf04f.png)
  
   ![resim43](https://user-images.githubusercontent.com/85406429/167373807-2d3e6010-5dea-41d2-92db-989bf70b10d8.png)  
</div>

## Kullanılan Teknolojiler
- ASP.NET Framework 4.7.2 Mvc
- Microsoft SQL Server Database
- Entity Framework DBFİRST Yaklaşımı
- Bootstrap
- Jquery
- Javascript
- HTML
- CSS

## Öngereklilikler
- Visual Studio 2019
- Microsoft SQL Server Management Studio 2018
- .NET Framework 4.7.2

## Nasıl Çalıştırırım?

<div align="justify">
Projeye ait gerekli dosyaları bilgisayarınıza indirdikten sonra .sql uzantılı <em>"Staj1DB ve Staj2DB"</em> scriptlerini ayrı ayrı <em>"Execute"</em> ettikten sonra projeye ait gerekli veritabanları ve veritabanı tabloları SQL Server'ınız içerisinde oluşturulmuş olucaktır. Daha sonra indirmiş olduğunuz klasör içerisindeki sln uzantılı <em>"StajTakip.sln"</em> dosyasını açınız. Projeye ait solution üzerine sağ tıklayıp ilk önce <em>"Clean Solution"</em> seçeneğini ardından ise <em>"Rebuild Solution"</em>'ı seçerek projeyi derleyiniz. Derleme işlemlerini başarıyla tamamlandıktan sonra proje içerisinde oluşturulmuş diğer alt projeleride aynı anda çalıştırmak için <em>"Solution"</em> sekmesine sağ tıklayarak özellikler bölümünden aşağıda gösterildiği gibi <em>"Multiple Startup Project"</em> seçeneğine tıklayarak diğer projeleri de start iznini verdikten sonra projeyi çalıştırabilirsiniz. Projeler çalıştıktan <em>"Staj1 ve Staj2"</em> projelerini alt sekmeye alıp ana localhost olan <em>"Staj Takip"</em> <em>"https://localhost:44306"</em> tarayıcısı üzerinden devam edebilirsiniz. 
</div>
</br>  
<div align="justify">
<b><I>NOT:</I></b> Projeye ait <em>"Solution"</em> sekmesi üzerinden aşağıdaki gibi tüm alt projelerdeki localhostlar çalışıcak şekilde ayarlamaları gerçekleştirmeyi unutmayınız.
  
 ![Ekran görüntüsü 2022-05-09 121100](https://user-images.githubusercontent.com/85406429/167378682-2c29eb54-3f62-4b56-bcad-e7ddadc64b29.png)
 

  
</div>




