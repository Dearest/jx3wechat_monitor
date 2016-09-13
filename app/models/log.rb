class Log < ApplicationRecord
  enum status: {passed: 0, unpass: 1}
end
