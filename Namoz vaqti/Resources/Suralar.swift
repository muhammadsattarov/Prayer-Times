//
//  Suralar.swift
//  Namoz vaqti
//
//  Created by user on 29/06/24.
//

import Foundation

  //MARK: - SURALAR
enum Suralar: Int, CaseIterable {
  case Fotiha
  case Ixlos
  case Annos
  case Kavsar
  case Falaq

  var description: String {
    switch self {
    case .Fotiha:
            """
            A’`uzu bill`ahi minash shayt`onir roj`iym. Bismill`ahir rohm`anir roh`iym. Al hamdulill`ahi robbil ‘`alam`iyn. Ar-rohm`anir roh`iym. M`aliki yavmidd`iyn. Iyy`aka na’budu va iyy`aka nasta’`iyn. Ihdinas sir`otol mustaq`iym. Sir`otollaz`iyna an’amta ‘alayhim g‘oyril mag‘z`ubi ‘alayhim valazz``oll`iyn.
            """
    case .Ixlos:
           """
             Bismill`ahir rohm`anir roh`iym. Qul huvall`ohu ahad. All`ohus-somad. Lam yal`id. Va lam `yuvlad va lam yakullah`u kufuvan ahad.
           """
    case .Annos:
           """
             Bismill`ahir rohm`anir roh`iym. Qul a’`uzu birrobin-n`asi malikin-n`asi il`ahin-n`asi minsharril vasv`asil xonn`as. Allaz`iy yuvasvisu f`iy sud`urin-n`asi minal jinnati van-n`as.
           """
    case .Kavsar:
           """
             Bismill`ahir rohm`anir roh`iym . Innaaa a’toynaakal-kavsar. Fasolli lirobbika vanhar. Inna shaania’ka huval-abtar.
           """
    case .Falaq:
           """
             Bismill`ahir rohm`anir roh`iym . K’ul a’uuzu birobbil-falak’. Min shar-ri maa xolak’. Va min sharri g’oosik’in izaa vak’ob. Va min sharrin-naffaasaati fil-’uk’od. Va min sharri haasidin izaa hasad.
           """
    }
  }

  var manosi: String {
    switch self {
    case .Fotiha:
            """
            Mazmuni: 
           Allohning dargohidan quvilgan shayton yomonligidan Allohning panohiga qochaman.
           Mehribon va rahmli Alloh nomi bilan (boshlayman).
           Hamd olamlar robbi Allohgakim (U) mehribon, rahmli va hisob-kitob kuni (Qiyomat)ning egasidir.
           Sengagina ibodat qilamiz va Sendangina yordam so’raymiz!
           Bizni shunday to’g’ri yo’lga boshlaginki,(U) Sen in’om (xidoyat) etganlarning (payg'ambarlar, siddiq va shahidlarning) yo’lidir.
           G’azabga uchragan (Muso qavmidan itoatsizlarning) va adashgan (Iso qavmining <<Allohning farzandi bor>> deydigan) larning emas!
           """
    case .Ixlos:
           """
            Mazmuni:
           (Ey Muhammad,) ayting: U — Alloh yagonadir.
           Alloh behojat, (lekin) hojatbarordir.
           U tug’magan va tug’ilmagan ham.
           Shuningdek, Unga teng biror zot yo’qdir.
           """
    case .Annos:
           """
            Ma’nosi:
           (Ey Muhammad,) ayting: “Panoh tilab iltijo qilurman odamlar Parvardigoriga, odamlar Ilohiga yashirin vasvasachi (shayton) yovuzligidanki, (u) odamlarning dillariga vasvasa solur. (O'zi) jinlar va odamlardandir”».
           """
    case .Kavsar:
           """
             Mazmuni: 
           (Ey Muhammad,) Albatta, Biz Sizga Kavsarni berdik.
           Bas, Robbingizga namoz o'qing va jonliq so'ying.
           Albatta, sizni yomon ko'rib  ayblovchining o'zini orqasi kesik.
           (Kavsar – jannatdagi bir ajib daryo yoki hovuzning nomi. Uning suvi asaldan totli, qor va suvdan oq. Undan ichgan kishi abadiy chanqoqlik ko’rmaydi.)
           """
    case .Falaq:
           """
             Mazmuni: (Ey Muhammad,) ayting: Tong robbidan panoh so'rayman.
           U yaratgan narsalar yomonligidan va kirib ketgan kechaning yomonligidan va tugunlarga dam soluvchilar yomonligidan va hasad qilgan hasadchining yomonligidan.
           """
    }
  }
}
