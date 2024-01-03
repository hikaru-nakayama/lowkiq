require 'lowkiq'
require 'pry'
class CalcStatementJob
    @queue = :payroll_statement_test
    def self.perform(id)
        puts "実行！！#{id}"
    end
end

Lowkiq.redis = 'redis://localhost:6379'
Lowkiq.enqueue(CalcStatementJob, 1)