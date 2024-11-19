<?php

namespace App\Controllers\Admin;

use CodeIgniter\Controller;
use CodeIgniter\HTTP\CLIRequest;
use CodeIgniter\HTTP\IncomingRequest;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use Psr\Log\LoggerInterface;

/**
 * Class BaseController
 *
 * BaseController provides a convenient place for loading components
 * and performing functions that are needed by all your controllers.
 * Extend this class in any new controllers:
 *     class Home extends BaseController
 *
 * For security be sure to declare any new methods as protected or private.
 */
abstract class BaseController extends Controller
{
    /**
     * Instance of the main Request object.
     *
     * @var CLIRequest|IncomingRequest
     */
    protected $request;

    /**
     * An array of helpers to be loaded automatically upon
     * class instantiation. These helpers will be available
     * to all other controllers that extend BaseController.
     *
     * @var array
     */
    protected $helpers = ['form', 'url', 'html', 'custom', 'setting'];

    /**
     * Be sure to declare properties for any property fetch you initialized.
     * The creation of dynamic property is deprecated in PHP 8.2.
     */
    // protected $session;

    /**
     * @return void
     */
    public function initController(RequestInterface $request, ResponseInterface $response, LoggerInterface $logger)
    {
        // Do Not Edit This Line
        parent::initController($request, $response, $logger);
        $this->ionAuth     = new \IonAuth\Libraries\IonAuth();
        $this->currentUser = $this->ionAuth->user()->row();
        $this->session = \Config\Services::session();
        $this->db = \Config\Database::connect();


        $tableTemplate = [
            'table_open' => ' <table class="table table-striped table-bordered table-sm">',

            'thead_open'  => '<thead>',
            'thead_close' => '</thead>',

            'heading_row_start'  => '<tr>',
            'heading_row_end'    => '</tr>',
            'heading_cell_start' => '<th>',
            'heading_cell_end'   => '</th>',

            'tfoot_open'  => '<tfoot>',
            'tfoot_close' => '</tfoot>',

            'footing_row_start'  => '<tr>',
            'footing_row_end'    => '</tr>',
            'footing_cell_start' => '<td>',
            'footing_cell_end'   => '</td>',

            'tbody_open'  => '<tbody>',
            'tbody_close' => '</tbody>',

            'row_start'  => '<tr>',
            'row_end'    => '</tr>',
            'cell_start' => '<td>',
            'cell_end'   => '</td>',

            'row_alt_start'  => '<tr>',
            'row_alt_end'    => '</tr>',
            'cell_alt_start' => '<td>',
            'cell_alt_end'   => '</td>',

            'table_close' => '</table>',
        ];
        $this->table = new \CodeIgniter\View\Table($tableTemplate);
        $this->validation = \Config\Services::validation();

        if (!$this->ionAuth->isAdmin()) {
            $message =  '<h2>No puedes ver esta pagina por permisos de acceso!</h2>';
            error_log($message);
            die($message);
        }
    }
}
