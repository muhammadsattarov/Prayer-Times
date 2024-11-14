//
//  NamazHeader.swift
//  Namoz vaqti
//
//  Created by user on 04/07/24.
//

import Foundation

enum NamazHeader: CaseIterable {
  case bomdod
  case peshin
  case asr
  case shom
  case hufton

  var description: String {
    switch self {
    case .bomdod:
      return """
      Bomdod namozi 2 rakat sunnat va 2 rakat farzdan iborat. Bomdod namozida avval 2 rakat sunnat keyin 2 rakat farz o'qiladi. 2 rakat sunnat namozi maxfiy(ya'ni ovozimizni faqat o'zimiz eshitadigan darajada) va 2 rakat farz namozi jahriy(ya'ni ovozimizni chiqargan holatda) o'qiymiz.
      """
    case .peshin:
      return """
            Peshin namozi to'rt rakat sunnat, to'rt rakat farz va ikki rakat sunnatdan iborat. Peshin namozida avval to'rt rakat sunnat keyin to'rt rakat farz va oxirida ikki rakat sunnat o'qiladi. Peshin namozini to'liq maxfiy(ya'ni ovozimizni faqat o'zimiz eshitadigan darajada) o'qimiz.
            """
    case .asr:
      return """
            Asr namozi to'rt rakat farzdan iborat. Asr namozini to'liq maxfiy(ya'ni ovozimizni faqat o'zimiz eshitadigan darajada) o'qimiz.
            """
    case .shom:
      return """
            Shom namozi uch rakat farz va ikki rakat sunnatdan iborat. Shom namozida avval uch rakat farz keyin ikki rakat sunnat o'qiladi. Uch rakat farz namozini jahriy(ya'ni ovozimizni chiqargan holatda) va ikki rakat sunnat namozi maxfiy(ya'ni ovozimizni faqat o'zimiz eshitadigan darajada) o'qiymiz.
            """
    case .hufton:
      return """
      Hufton namozi to'rt rakat farz, ikki rakat sunnat va 3 rakat vitr vojibdan iborat. Hufton namozida avval to'rt rakat farz keyin ikki rakat sunnat so'ngida uch rakat vitr o'qiladi. To'rt rakat farz namozi jahriy(ya'ni ovozimizni chiqargan holatda), sunnat va vitr namozlari esa to'liq maxfiy(ya'ni ovozimizni faqat o'zimiz eshitadigan darajada) o'qiladi.
      """
    }
  }
}
