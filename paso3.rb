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

    #Añadimos un resumen de saldo
    def balance
        balance = 0.0
        @transactions.each do |transactions|
            balance += transactions[:amount]
        end
        return balance
    end

    #Y sobreescribimos el método tostring
    def to_s
        "Nombre: #{name}, Saldo: #{sprintf("%0.2f", balance)}€"
    end

  end
  
  bank_account = BankAccount.new("David")
  bank_account.credit("Pago Nómina", 1000)
  bank_account.debit("Burger King", 18)
  puts bank_account#llama al metodo to_s
