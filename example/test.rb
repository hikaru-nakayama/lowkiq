require_relative '../lib/lowkiq'
require 'pry'

Lowkiq.redis = 'redis://localhost:6379'
Lowkiq.enqueue(CalcStatementJob, 1)

class CalcStatementJob
    @queue = :payroll_statement_test
    def self.perform(id)
        puts "実行！！#{id}"
    end
end
