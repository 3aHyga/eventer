# Eventer

Eventer есть простой движокъ для управления событями класса.

Eventer is simple engine to control custom class events.

## Использованіе (Usage)

### Используя методъ экземпляра класса (Using the class instance method)
Создай класс, и задай допустимыя для него событія. Затѣмъ создай экземпляръ класса и задай обработчикъ событія въ блокѣ съ помощью метода 'on_...' экземпляра класса, гдѣ вмѣсто ... задай имя событія. А потомъ, по необходимости, дёрни событіе методомъ 'event' экземпляра класса. А плодомъ выполненія сего метода будетъ словарь (Hash) съ ключами какъ экземплярами класса Proc отражающими вызванные обработчики и со значеніями какъ плодами работы сихъ обработчиковъ:

Make a class, and set the allowable events for it. Then create a class instance, and set handler to process an event as a block using 'on_...' method of the class instance, where instead ... put the name of the event. And then, if needed, trigger event with the 'event' method of the class instance. The result is a Hash with keys as the handler block instance, and values as the handler's output:

    class Test
      events :event
    end

    t = Test.new

    t.on_event do |args|
      "Matched"
    end # -> {<#Proc...> => "Matched"}

# Права (Copyright)

Авторскія и исключительныя права (а) 2011 Малъ Скрылевъ
Зри LICENSE за подробностями.

Copyright (c) 2011 Malo Skrylevo
See LICENSE for details.

