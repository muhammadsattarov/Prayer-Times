//
//  Duolar.swift
//  Namoz vaqti
//
//  Created by user on 29/06/24.
//

import Foundation

enum Duolar: Int {
  case sano
  case salovat
  case robbana
  case attahiyat
  case qunut
  case vitr

  var description: String {
    switch self {
    case .sano:
        """
         Subhanakallouhumma va bihamdika va tabarokasmuka va taa’la jadduka va la ilaha g‘oyruk.
         Ma'nosi: «Allohim! Sening noming muborakdir. Shon-sharafing ulug'dir. Sendan o'zga iloh yo'qdir».
        """
    case .salovat:
        """
         Allohumma solli ‘ala Muhammadiv-va ‘ala ali Muhammad. Kama sollayta ‘ala Ibrohima va ‘ala ali Ibrohim. Innaka hamidum-majid.
         Allohumma barik ‘ala Muhammadiv-va ‘ala ali Muhammad. Kama barokta ‘ala Ibrohima va ‘ala ali Ibrohim. Innaka hamidum-majid.
        """
    case .robbana:
        """
        Robbana atina fid-dunya hasanatav-va fil axiroti hasanatav-va qina azaban-nar.
        """
    case .attahiyat:
        """
        Attahiyyatu lillahi vas-solavatu vattoyyibat. Assalamu ‘alayka ayyuhan-nabiyyu va rohmatullohi va barokatuh. Assalamu ‘alayna va ‘ala ibadillahis-solihiyn. Ashhadu alla ilaha illallohu va ashhadu anna Muhammadan ‘abduhu va rosuluh.
        """
    case .qunut:
      """
        QUNUT DUOSI
        Allohumma inna nasta'inuka va nastag'firuk. Vanu'minu bika va natavakalu 'alayka va nusniy 'alaykal xoyr. Kullahu nashkuruka va la nakfuruk. Va naxla'u va natruku may-yafjuruk.
        Allohumma iyyaka na'budu va laka nusolliy va nasjudu va ilayka nas'a va nahfidu narju rohmatak(a). Va naxsha 'azabaka inna 'azabaka bil kuffari mulhiq
    """
    case .vitr:
        """
         VITR NAMOZI
         Vitr namozi uch rakatli bo'lib, vojib ibodat sanaladi. Farzdan quyiroq, sunnatdan ulug' turadi. O'qilishi shart. Biror sabab ila vaqtida o'qilmay qolsa, qazosi o'qiladi. Vitr namozi xufton namozidan keyin o'qiladi.
         Quyidagi tartibda ado etiladi:
         1. Niyat.
         2. Iftitoh takbiri.
         3. Sano.
         4. Fotiha, zam sura.
         5. Ruku.
         6. Sajda.
         7. Ikkinchi rakatga turib, «Fotiha», zam sura.
         8. Ruku.
         9. Sajda.
         10. O'tirib, «Attahiyyat» duosi.
         11. Uchinchi rakatga turib «Fotiha», zam sura.
         12. Zam suradan keyin o'sha tik turgan holda «Allohu akbar», deb quloq qoqiladi.
         13. Qo'l qovushtirilib, Qunut duosi o'qiladi.
        """
    }
  }
}
