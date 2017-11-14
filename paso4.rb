#ejercicio, añade un resumencon los detalles mostrados

  class BankAccount
    attr_reader :name
  
    def initialize(name)
      @name = name
      @transactions = []
      add_transaction("Saldo disponible", 0)
    end
  
    def credit(description, amount)
      add_transaction(description, amount)
    end
  
    def debit(description, amount)
      add_transaction(description, -amount)
    end
  
    def add_transaction(description, amount)
      @transactions.push(description: description, amount: amount)
    end

    def balance
        balance = 0.0
        @transactions.each do |transactions|
            balance += transactions[:amount]
        end
        return balance
    end

    def to_s
        "Name: #{name}, Saldo: #{sprintf("%0.2f", balance)}€"
    end

    #resolvemos a la ruby
    def print_register
    puts "#{name} extracto"#título de la tabla
    puts "-" * 40

    puts "Detalle".ljust(30) + "Cantidad".rjust(10)
    @transactions.each do |transaction|
      puts transaction[:description].ljust(30) + sprintf("%0.2f", transaction[:amount]).rjust(10)
    end

    puts "-" * 40
    puts "Saldo:".ljust(30) + sprintf("%0.2f", balance).rjust(10)
    puts "-" * 40
  end

  end
  
  bank_account = BankAccount.new("David")
  bank_account.credit("Pago Nómina", 1000)
  bank_account.debit("Burger King", 18)
  puts bank_account.print_register
