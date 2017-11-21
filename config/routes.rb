SatCatalogos::Engine.routes.draw do
  match 'servicio' => 'servicio#index', as: :servicio
end
