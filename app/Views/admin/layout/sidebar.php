      <!-- Main Sidebar Container -->
      <aside class="main-sidebar sidebar-bg-dark sidebar-color-primary shadow">
          <div class="brand-container">
              <a href="javascript:;" class="brand-link">
                  <img src="<?= base_url('asset/img/AdminLTELogo.png') ?>" alt="AdminLTE Logo"
                      class="brand-image opacity-80 shadow">
                  <span class="brand-text fw-light">AdminLTE 4</span>
              </a>
              <a class="pushmenu mx-1" data-lte-toggle="sidebar-mini" href="javascript:;" role="button"><i
                      class="fas fa-angle-double-left"></i></a>
          </div>
          <!-- Sidebar -->
          <div class="sidebar">
              <nav class="mt-2">
                  <!-- Sidebar Menu -->
                  <ul class="nav nav-pills nav-sidebar flex-column" data-lte-toggle="treeview" role="menu"
                      data-accordion="false">






                      <li class="nav-item">
                          <a href="<?= base_url('admin/dashboard/index') ?>" class="nav-link">
                              <i class="nav-icon fas fa-circle"></i>
                              <p>Panel Control</p>
                          </a>
                      </li>

                      <li class="nav-item">
                          <a href="<?= base_url('auth') ?>" class="nav-link">
                              <i class="nav-icon fas fa-circle"></i>
                              <p>Usuarios</p>
                          </a>
                      </li>

                      <li class="nav-item">
                          <a href="<?= base_url('admin/userdata/') ?>" class="nav-link">
                              <i class="nav-icon fas fa-circle"></i>
                              <p>Empleados</p>
                          </a>
                      </li>

                      <li class="nav-item">
                          <a href="<?= base_url('admin/customers/') ?>" class="nav-link">
                              <i class="nav-icon fas fa-users"></i>
                              <p>Clientes</p>
                          </a>
                      </li>





                      <li class="nav-item">
                          <a href="<?= base_url('admin/orders/') ?>" class="nav-link">
                              <i class="nav-icon fa-solid fa-money-check"></i>
                              <p>Ordenes</p>
                          </a>
                      </li>

                      <li class="nav-item">
                          <a href="<?= base_url('admin/cuts/') ?>" class="nav-link">
                              <i class="nav-icon fa-solid fa-money-check"></i>
                              <p>Cuts</p>
                          </a>
                      </li>

                      <li class="nav-item">
                          <a href="<?= base_url('admin/installments/') ?>" class="nav-link">
                              <i class="nav-icon fa-solid fa-money-check"></i>
                              <p>Abonos</p>
                          </a>
                      </li>




                      <li class="nav-item">
                          <a href="<?= base_url('admin/machines/') ?>" class="nav-link">
                              <i class="nav-icon fa-solid fa-hard-drive"></i>
                              <p>Maquinas</p>
                          </a>
                      </li>









                      <li class="nav-item">
                          <a href="#" class="nav-link">
                              <i class="nav-icon fas fa-tachometer-alt"></i>
                              <p>
                                  CRM
                                  <i class="right fas fa-angle-left" style="float: right;"></i>
                              </p>
                          </a>
                          <ul class="nav nav-treeview">
                              <li class="nav-item">
                                  <a href="<?= base_url('admin/providers/') ?>" class="nav-link">
                                      <i class="far fa-circle nav-icon"></i>
                                      <p>Proveedores</p>
                                  </a>
                              </li>
                              <li class="nav-item">
                                  <a href="<?= base_url('admin/items/') ?>" class="nav-link">
                                      <i class="far fa-circle nav-icon"></i>
                                      <p>Productos</p>
                                  </a>
                              </li>
                              <li class="nav-item">
                                  <a href="<?= base_url('admin/brands/') ?>" class="nav-link">
                                      <i class="far fa-circle nav-icon"></i>
                                      <p>Marcas</p>
                                  </a>
                              </li>
                              <li class="nav-item">
                                  <a href="<?= base_url('admin/supplies/') ?>" class="nav-link">
                                      <i class="far fa-circle nav-icon"></i>
                                      <p>Insumos</p>
                                  </a>
                              </li>



                              <li class="nav-item">
                                  <a href="<?= base_url('admin/estimates/') ?>" class="nav-link">
                                      <i class="far fa-circle nav-icon"></i>
                                      <p>Presupuestos</p>
                                  </a>
                              </li>
                              <li class="nav-item">
                                  <a href="<?= base_url('admin/CatExIn/') ?>" class="nav-link">
                                      <i class="far fa-circle nav-icon"></i>
                                      <p>Cat Ingresos-Gastos</p>
                                  </a>
                              </li>
                              <li class="nav-item">
                                  <a href="<?= base_url('admin/expenses/') ?>" class="nav-link">
                                      <i class="far fa-circle nav-icon"></i>
                                      <p>Gastos</p>
                                  </a>
                              </li>
                          </ul>
                      </li>



                      <li class="nav-item">
                          <a href="#" class="nav-link">
                              <i class="nav-icon fas fa-tachometer-alt"></i>
                              <p>
                                  HRM
                                  <i class="right fas fa-angle-left" style="float: right;"></i>
                              </p>
                          </a>
                          <ul class="nav nav-treeview">
                              <li class="nav-item">
                                  <a href="<?= base_url('admin/userdata/') ?>" class="nav-link">
                                      <i class="nav-icon fas fa-circle"></i>
                                      <p>Empleados</p>
                                  </a>
                              </li>

                              <li class="nav-item">
                                  <a href="<?= base_url('admin/salaries/') ?>" class="nav-link">
                                      <i class="nav-icon fas fa-circle"></i>
                                      <p>Salarios</p>
                                  </a>
                              </li>

                              <li class="nav-item">
                                  <a href="<?= base_url('admin/loans/') ?>" class="nav-link">
                                      <i class="nav-icon fas fa-circle"></i>
                                      <p>Prestamos</p>
                                  </a>
                              </li>

                              <li class="nav-item">
                                  <a href="<?= base_url('admin/leaves/') ?>" class="nav-link">
                                      <i class="nav-icon fas fa-circle"></i>
                                      <p>Permisos</p>
                                  </a>
                              </li>
                              <li class="nav-item">
                                  <a href="<?= base_url('admin/leaveTypes/') ?>" class="nav-link">
                                      <i class="nav-icon fas fa-circle"></i>
                                      <p>Categoria Permisos</p>
                                  </a>
                              </li>


                          </ul>
                      </li>



















                      <li class="nav-item">
                          <a href="#" class="nav-link">
                              <i class="nav-icon fas fa-tachometer-alt"></i>
                              <p>
                                  Tickets
                                  <i class="right fas fa-angle-left" style="float: right;"></i>
                              </p>
                          </a>
                          <ul class="nav nav-treeview">
                              <li class="nav-item">
                                  <a href="<?= base_url('admin/tickets/') ?>" class="nav-link">
                                      <i class="far fa-circle nav-icon"></i>
                                      <p>Tickets Enviados</p>
                                  </a>
                              </li>
                              <li class="nav-item">
                                  <a href="<?= base_url('admin/tickets/list') ?>" class="nav-link">
                                      <i class="far fa-circle nav-icon"></i>
                                      <p>Tickets recibidos</p>
                                  </a>
                              </li>
                              <li class="nav-item">
                                  <a href="<?= base_url('admin/category/') ?>" class="nav-link">
                                      <i class="far fa-circle nav-icon"></i>
                                      <p>Categorias</p>
                                  </a>
                              </li>
                          </ul>
                      </li>



                      <li class="nav-item">
                          <a href="<?= base_url('admin/mop/') ?>" class="nav-link">
                              <i class="nav-icon fa-solid fa-hard-drive"></i>
                              <p>MOP</p>
                          </a>
                      </li>



                      <li class="nav-item">
                          <a href="<?= base_url('admin/task/') ?>" class="nav-link">
                              <i class="nav-icon fa-solid fa-hard-drive"></i>
                              <p>Tareas</p>
                          </a>
                      </li>





                      <li class="nav-item">
                          <a href="<?= base_url('admin/holidays/') ?>" class="nav-link">
                              <i class="nav-icon fa-solid fa-hard-drive"></i>
                              <p>Festivos</p>
                          </a>
                      </li>




                      <li class="nav-item">
                          <a href="<?= base_url('admin/settings/index') ?>" class="nav-link">
                              <i class="nav-icon fa-solid fa-gears"></i>
                              <p>Ajustes</p>
                          </a>
                      </li>




              </nav>
          </div>
          <!-- /.sidebar -->
      </aside>