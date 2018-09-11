[Mesh]
  file = single_pellet.e
[]

[Variables]
  [./temp]
    initial_condition = 300
  [../]
[]

[Kernels]
  [./heat_conduction]
    type = HeatConduction
    variable = temp
  [../]
  [./heat_source]
    type = HeatSource
    variable = temp
    value = 100
  [../]
[]

[Materials]
  [./heat_conductor]
    type = HeatConductionMaterial
    thermal_conductivity = .1
  [../]
[]

[BCs]
  [./left]
    type = DirichletBC
    variable = temp
    boundary = 12
    value = 300
  [../]
[]

[Executioner]
  type = Steady
  solve_type = 'PJFNK'
[]

[Outputs]
  exodus = true
[]

[Postprocessors]
  [./peak_temp]
    type = NodalMaxValue
    variable = temp
  [../]
[]
