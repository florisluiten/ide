<?php
/**
 * Some file that does something.
 *
 * @author Floris Luiten <floris.luiten@tweakers.net>
 */

declare(strict_types=1);

namespace App\Service;

/**
 * Some file
 *
 * A controller that does something
 */
class SomeFile
{
    public function someMethod(string $someParameter): int
    {
        return strlen($someParameter);
    }
}
