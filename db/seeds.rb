require_relative("../models/member.rb")
require_relative("../models/gymclass.rb")
require_relative("../models/signed_up.rb")
require("pry-byebug")

Member.delete_all()
Gymclass.delete_all()
Signed_up.delete_all()

member1 = Member.new({
  "first_name" => "Clive",
  "second_name" => "Jones"
  })
  member1.save()

  member2 = Member.new({
    "first_name" => "Susan",
    "second_name" => "Swan"
    })
    member2.save()

    member3 = Member.new({
      "first_name" => "Paul",
      "second_name" => "Johnson"
      })
      member3.save()

      gymclass1 = Gymclass.new({
        "title" => "Spinfit",
        "time" => "8:00"
        })
        gymclass1.save()

        gymclass2 = Gymclass.new({
          "title" => "Yoga",
          "time" => "5:00"
          })
          gymclass2.save()


          gymclass3 = Gymclass.new({
            "title" => "Pilates",
            "time" => "7:00"
            })
            gymclass3.save()

            signed_up1 = Signed_up.new({'member_id' => member1.id, 'gymclass_id' => gymclass1.id})
            signed_up1.save()
            signed_up2 = Signed_up.new({'member_id' => member2.id, 'gymclass_id' => gymclass2.id})
            signed_up2.save()
            signed_up3 = Signed_up.new({'member_id' => member3.id, 'gymclass_id' => gymclass3.id})
            signed_up3.save()
