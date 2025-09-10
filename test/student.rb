require "minitest/autorun"
require_relative "../../src/warmup.rb"
require_relative "../../src/phonebook.rb"

class StudentTests < Minitest::Test
    def setup
        @phonebook = PhoneBook.new
    end

    def test_public_fib
      assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89], fib(12))
      assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181], fib(20))
      assert_equal([], fib(-1))    
    end

    def test_public_ispalindrome
        assert_equal(true, isPalindrome(12345677654321))
        assert_equal(true, isPalindrome(41112221114))
        assert_equal(false, isPalindrome(1234))
        assert_equal(false, isPalindrome(100))
    end

    def test_public_nthmax
        assert_equal(7, nthmax(1, [7, 6, 5, 7, 1]))
        assert_equal(0, nthmax(4, [172, 867, 285, 991, 0]))
        assert_nil(nthmax(1, [100]))
    end

    def test_public_freq
        assert_equal("l", freq("hello"))
        assert_equal(" ", freq("      "))
        assert_equal("!", freq("IM NOT CRAZY!!!!!!!"))
    end

    def test_public_ziphash
        assert_equal({"California" => "Sacramento", "Texas" => "Austin",
          "Florida" => "Tallahassee", "New York" => "Albany", "Illinois" => "Springfield"}, 
          zipHash(["California", "Texas", "Florida", "New York", "Illinois"],
           ["Sacramento", "Austin", "Tallahassee", "Albany", "Springfield"]))
    end

    def test_public_hashtoarray
        assert_equal([[1, "me"], ["me", 1], [2, "hold"]], hashToArray({1 => "me", "me" => 1, 2 => "hold"}))
        assert_equal([["alpha", 1], ["bravo", 2], ["charlie", 3], ["delta", 4]], hashToArray({"alpha" => 1, "bravo" => 2, "charlie" => 3, "delta" => 4}))
    end

    def test_public_phonebook_add
        assert_equal(true, @phonebook.add("Mary", "888-888-8888", true))
        assert_equal(true, @phonebook.add("Jane", "888-888-8888", false))
        assert_equal(false, @phonebook.add("Cord", "888_888_8888", false))
        assert_equal(false, @phonebook.add("Samson", "888-888-88880", false))
        assert_equal(false, @phonebook.add("John", "088-888-8888", false))
    end

    def test_public_phonebook_lookup
        assert_equal(true, @phonebook.add("Gary", "123-456-7777", false))
        assert_equal(true, @phonebook.add("Thomas", "800-588-2300", true))

        #Added test to check for someone not added to list at all
        assert_nil(@phonebook.lookup("Mary"))
        assert_equal("800-588-2300", @phonebook.lookup("Thomas"))
    end

    def test_public_phonebook_lookup_by_num
        assert_equal(true, @phonebook.add("Susan", "567-118-0101", true))
        assert_equal(true, @phonebook.add("Brat", "777-777-7777", true))
        assert_equal(true, @phonebook.add("Jacky", "218-218-0000", false))
        assert_nil(@phonebook.lookupByNum("1"))
        assert_nil(@phonebook.lookupByNum("888-888-88888"))
        assert_nil(@phonebook.lookupByNum("218-218-0000"))
        assert_equal("Brat", @phonebook.lookupByNum("777-777-7777"))
        assert_equal("Susan", @phonebook.lookupByNum("567-118-0101"))
    end

    def test_public_names_by_ac
        assert_equal(true, @phonebook.add("That's", "800-111-1111", false))
        assert_equal(true, @phonebook.add("A", "800-123-1234", true))
        assert_equal(true, @phonebook.add("Porcupine", "999-888-7777", false))
        assert_equal(true, @phonebook.add("Ow!", "800-000-0000", true))

        #Empty string test
        assert_equal([], @phonebook.namesByAc(""))
        #Added all numbers
        assert_equal([], @phonebook.namesByAc("800-111-1111"))

        #Regular Test
        assert_equal(["That's", "A", "Ow!"].sort, @phonebook.namesByAc("800").sort)

    end
end
