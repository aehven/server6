class CteResultHeader < ApplicationRecord
  has_paper_trail

  belongs_to :cte

  has_many :cte_results

  def averages
    results = cte_results

    { 
      qualified_gait_cycle: cte_results.average(:qualified_gait_cycle),
      cadence: cte_results.average(:cadence),
      stride_length: cte_results.average(:stride_length),
      walk_speed: cte_results.average(:walk_speed),
      tib_rom: cte_results.average(:tib_rom),
      knee_rom: cte_results.average(:knee_rom)
    }
  end
end